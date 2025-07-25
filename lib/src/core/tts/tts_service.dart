import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:the_kids_app/src/core/tts/tts_platform_interface.dart'; // Ensure this path is correct

// Callbacks to communicate state changes to the consumer of this service.
typedef TtsOnStart = void Function();
typedef TtsOnCompletion = void Function();
typedef TtsOnError = void Function(String message);
typedef TtsOnVoicesChanged = void Function();

/// A robust, thread-safe service for Text-To-Speech (TTS) functionalities.
///
/// This class manages a single `FlutterTts` instance and provides a safe API
/// for speaking text in multiple languages. It uses an internal operation queue
/// to prevent race conditions, ensuring that all TTS commands are executed sequentially.
class TtsService {
  late final FlutterTts _flutterTts;
  late final TtsPlatformInterface _platformInterface;

  bool _isInitialized = false;
  String? _initializationError;

  Completer<void>? _webTtsReadyCompleter;
  final Duration _webTtsReadyTimeout = const Duration(seconds: 10);

  // This queue ensures that TTS operations are executed one after another.
  Future<void> _operationQueue = Future.value();

  // --- Default Speech Parameters ---
  static const double _defaultVolume = 1.0;
  static const double _defaultPitch = 1.0;
  static final double _defaultRate = (kIsWeb) ? 0.9 : 0.5;

  // --- Current State of the TTS Engine ---
  String? _currentLanguage;
  String? _currentVoiceName;
  double _volume = _defaultVolume;
  double _pitch = _defaultPitch;
  double _rate = _defaultRate;

  // --- Callbacks ---
  TtsOnStart? onStart;
  TtsOnCompletion? onCompletion;
  TtsOnError? onError;
  TtsOnVoicesChanged? onVoicesChanged;

  // --- Getters for current engine state ---
  bool get isInitialized => _isInitialized;
  String? get initializationError => _initializationError;
  String? get currentLanguage => _currentLanguage;
  String? get currentVoiceName => _currentVoiceName;
  double get volume => _volume;
  double get pitch => _pitch;
  double get rate => _rate;

  TtsService() {
    _flutterTts = FlutterTts();
    _setHandlers();

    if (kIsWeb) {
      _webTtsReadyCompleter = Completer<void>();
      _platformInterface = TtsPlatformInterface();
      _platformInterface.addPlatformEventListeners(_onVoicesChangedWeb);
    }
  }

  /// Initializes the TTS engine. Must be called before any other methods.
  Future<void> initialize() {
    return _addToOperationQueue(() async {
      if (_isInitialized) return;

      try {
        if (kIsWeb) {
          await _webTtsReadyCompleter?.future.timeout(
            _webTtsReadyTimeout,
            onTimeout: () => throw TimeoutException(
              'Web TTS voices did not become ready in time.',
            ),
          );
        }

        // Directly apply default parameters without checking for initialization.
        await _internalApplyDefaultParameters();

        _isInitialized = true;
        debugPrint("TtsService initialized successfully.");
      } catch (e) {
        _initializationError = "TTS Initialization Error: ${e.toString()}";
        _isInitialized = false;
        rethrow;
      }
    });
  }

  // --- Public API Methods ---

  /// Speaks the given text using the specified language.
  Future<void> speak(String text, {required String languageCode}) {
    return _addToOperationQueue(() async {
      _ensureInitialized();
      if (text.trim().isEmpty) return;

      if (languageCode != _currentLanguage) {
        await _internalSetLanguageAndVoice(languageCode);
      }

      await _flutterTts.speak(text);
    });
  }

  /// Stops the current speech immediately. This action is not queued.
  Future<void> stop() {
    _operationQueue = Future.value(); // Clear pending operations.
    return _flutterTts.stop();
  }

  /// Sets the speech volume [0.0 - 1.0].
  Future<void> setVolume(double newVolume) {
    return _addToOperationQueue(() async {
      _ensureInitialized();
      _volume = newVolume.clamp(0.0, 1.0);
      await _flutterTts.setVolume(_volume);
    });
  }

  /// Sets the speech pitch [0.5 - 2.0].
  Future<void> setPitch(double newPitch) {
    return _addToOperationQueue(() async {
      _ensureInitialized();
      _pitch = newPitch.clamp(0.5, 2.0);
      await _flutterTts.setPitch(_pitch);
    });
  }

  /// Sets the speech rate [0.0 - 1.0].
  Future<void> setSpeechRate(double newRate) {
    return _addToOperationQueue(() async {
      _ensureInitialized();
      _rate = newRate.clamp(0.0, 1.0);
      await _flutterTts.setSpeechRate(_rate);
    });
  }

  /// Resets volume, pitch, and rate to their default values.
  Future<void> resetSpeechParameters() {
    return _addToOperationQueue(() {
      _ensureInitialized();
      return _internalApplyDefaultParameters();
    });
  }

  /// Fetches a list of all language codes supported by the TTS engine.
  Future<List<String>> getSupportedLanguages() {
    return _addToOperationQueue<List<String>>(() async {
      _ensureInitialized();
      return _internalGetSupportedLanguages();
    });
  }

  /// Fetches a list of available voices for a specific language code.
  Future<List<Map<dynamic, dynamic>>> getVoicesForLanguage(
    String languageCode,
  ) {
    return _addToOperationQueue<List<Map<dynamic, dynamic>>>(() async {
      _ensureInitialized();
      return _internalGetVoicesForLanguage(languageCode);
    });
  }

  /// Finds and returns the best-quality voice for a given language.
  Future<Map<dynamic, dynamic>?> getBestVoiceForLanguage(String languageCode) {
    return _addToOperationQueue<Map<dynamic, dynamic>?>(() async {
      _ensureInitialized();
      final voices = await _internalGetVoicesForLanguage(languageCode);
      return _findBestVoice(voices);
    });
  }

  /// Disposes of the TTS engine resources.
  void dispose() {
    _flutterTts.stop();
    if (kIsWeb) {
      _platformInterface.removePlatformEventListeners();
    }
  }

  // --- Private Internal Logic Methods (No Queuing or Safety Checks) ---
  // These methods contain the raw logic and are only ever called from within
  // a queued operation, making them safe from concurrency issues.

  /// Applies default speech parameters directly to the TTS engine.
  Future<void> _internalApplyDefaultParameters() async {
    _volume = _defaultVolume;
    _pitch = _defaultPitch;
    _rate = _defaultRate;
    await _flutterTts.setVolume(_volume);
    await _flutterTts.setPitch(_pitch);
    await _flutterTts.setSpeechRate(_rate);
  }

  /// Gets supported languages directly from the TTS engine.
  Future<List<String>> _internalGetSupportedLanguages() async {
    final languages = await _flutterTts.getLanguages as List<dynamic>?;
    return languages?.cast<String>().toList() ?? [];
  }

  /// Gets voices for a language directly from the TTS engine.
  Future<List<Map<dynamic, dynamic>>> _internalGetVoicesForLanguage(
    String languageCode,
  ) async {
    final allVoices = await _flutterTts.getVoices as List<dynamic>?;
    if (allVoices == null) return [];

    final String baseLanguage = languageCode.split('-').first.toLowerCase();
    return allVoices
        .where(
          (voice) =>
              (voice as Map<dynamic, dynamic>)['locale']
                  ?.toString()
                  .toLowerCase()
                  .startsWith(baseLanguage) ??
              false,
        )
        .cast<Map<dynamic, dynamic>>()
        .toList();
  }

  /// Sets the language and voice directly on the TTS engine.
  Future<void> _internalSetLanguageAndVoice(String languageCode) async {
    await _flutterTts.setLanguage(languageCode);
    _currentLanguage = languageCode;

    // Use the internal method to get voices to avoid deadlocking the queue.
    final voices = await _internalGetVoicesForLanguage(languageCode);
    final bestVoice = _findBestVoice(voices);

    if (bestVoice != null) {
      await _flutterTts.setVoice(bestVoice.cast<String, String>());
      _currentVoiceName = bestVoice['name'] ?? bestVoice['voiceURI'];
      debugPrint(
        "Switched TTS language to '$languageCode' and voice to '$_currentVoiceName'",
      );
    } else {
      await _flutterTts.setVoice({});
      _currentVoiceName = null;
      debugPrint(
        "Switched TTS language to '$languageCode'. No specific voice found, using engine default.",
      );
    }
  }

  // --- Other Private Helper Methods ---

  /// Sequentially executes the given [operation] to prevent race conditions.
  Future<T> _addToOperationQueue<T>(Future<T> Function() operation) {
    final completer = Completer<T>();
    _operationQueue = _operationQueue
        .then((_) async {
          try {
            final result = await operation();
            completer.complete(result);
          } catch (e, st) {
            completer.completeError(e, st);
          }
        })
        .catchError((e) {
          debugPrint('TTS error: $e');
          // Prevents a single failure from blocking the entire queue.
        });
    return completer.future;
  }

  /// Throws a detailed StateError if the service is not initialized.
  void _ensureInitialized() {
    if (!_isInitialized) {
      throw StateError(
        'TtsService has not been initialized or initialization failed. '
        'Error: ${_initializationError ?? "Unknown. Call initialize() first."}',
      );
    }
  }

  void _onVoicesChangedWeb() {
    debugPrint('Web: voiceschanged event fired!');
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_webTtsReadyCompleter != null &&
          !_webTtsReadyCompleter!.isCompleted) {
        _webTtsReadyCompleter!.complete();
      }
      onVoicesChanged?.call();
    });
  }

  void _setHandlers() {
    _flutterTts.setStartHandler(() => onStart?.call());
    _flutterTts.setCompletionHandler(() => onCompletion?.call());
    _flutterTts.setErrorHandler((message) {
      if (message != 'interrupted') {
        onError?.call(message);
      }
    });
  }

  /// Finds the best voice using a scoring system.
  Map<dynamic, dynamic>? _findBestVoice(List<dynamic> voices) {
    if (voices.isEmpty) return null;

    String getVoiceAttribute(Map<dynamic, dynamic> voice, String key) =>
        (voice[key] ?? '').toString().toLowerCase();
    Map<dynamic, dynamic>? bestVoice;
    int highestScore = -1;

    for (final voice in voices.cast<Map<dynamic, dynamic>>()) {
      int currentScore = 0;
      final String name = getVoiceAttribute(voice, 'name');
      final String quality = getVoiceAttribute(voice, 'quality');

      if (kIsWeb || defaultTargetPlatform == TargetPlatform.android) {
        if (name.contains('wavenet') || name.contains('neural')) {
          currentScore += 100;
        }
      }
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        if (name.contains('siri') &&
            (quality.contains('enhanced') || quality.contains('premium'))) {
          currentScore += 100;
        }
        if (name.contains('premium')) currentScore += 90;
      }
      if (quality.contains('enhanced') || quality.contains('premium')) {
        currentScore += 50;
      }
      if (quality.contains('high')) currentScore += 40;
      if (name.contains('google')) currentScore += 20;
      if (name.contains('apple') || name.contains('siri')) currentScore += 20;
      if (name.contains('microsoft')) currentScore += 15;
      if (getVoiceAttribute(voice, 'gender') == 'female') currentScore += 5;
      if (name.contains('default') || name.contains('system')) {
        currentScore += 1;
      }

      if (currentScore > highestScore) {
        highestScore = currentScore;
        bestVoice = voice;
      }
    }

    if (bestVoice == null && voices.isNotEmpty) {
      debugPrint(
        "No suitable voice found with scoring, falling back to the first available voice.",
      );
      return voices.first;
    }

    debugPrint(
      "Best voice selected: ${bestVoice?['name']} with score: $highestScore",
    );
    return bestVoice;
  }
}
