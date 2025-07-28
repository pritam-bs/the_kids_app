import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:the_kids_app/src/core/di/injection.dart';
import 'package:the_kids_app/src/presentation/widgets/tts/sentence_splitter.dart';
import 'package:the_kids_app/src/core/tts/tts_service.dart';

enum TtsState { initial, playing, stopped, paused, error }

/// A controller that bridges the `TtsService` with the Flutter widget tree.
///
/// This class manages the state for UI-related TTS features, such as sentence
/// highlighting and playback state (`playing`, `paused`, etc.). It uses an
/// instance of `TtsService` to perform the actual TTS operations.
///
/// **IMPORTANT:** You must call the `initialize()` method before using any other
/// functionality.
class TtsController extends ChangeNotifier {
  final TtsService _ttsService = getIt<TtsService>();

  // --- UI State ---
  TtsState _ttsState = TtsState.initial;
  String? _errorMessage;
  String _text = '';
  List<TextSegment> _sentenceList = [];
  String _languageCode; // The target language for this controller instance.

  // --- Highlighting State ---
  int _highlightStartOffset = -1;
  int _highlightEndOffset = -1;
  bool _isHighlightingEnabled = false;

  // --- Playback Queue State ---
  List<TextSegment> _sentenceQueue = [];
  int _currentSentenceIndex = 0;

  // --- Getters for UI state ---
  TtsState get ttsState => _ttsState;
  bool get isInitialized => _ttsService.isInitialized;
  String? get initializationError => _ttsService.initializationError;
  String? get errorMessage => _errorMessage;
  String get languageCode => _languageCode;
  List<TextSegment> get sentenceList => _sentenceList;

  // --- Getters for highlighting ---
  int get highlightStartOffset => _highlightStartOffset;
  int get highlightEndOffset => _highlightEndOffset;
  bool get isHighlightingEnabled => _isHighlightingEnabled;

  // --- Getters for playback state ---
  bool get isPlaying => _ttsState == TtsState.playing;
  bool get isStopped =>
      _ttsState == TtsState.stopped || _ttsState == TtsState.initial;
  bool get isPaused => _ttsState == TtsState.paused;

  /// Creates a TtsController.
  ///
  /// [languageCode]: The BCP 47 language code (e.g., 'en-US') to be used for speech.
  TtsController({required String languageCode}) : _languageCode = languageCode {
    // Register callbacks to listen to events from the TtsService.
    _ttsService.onStart = _handleStart;
    _ttsService.onCompletion = _handleCompletion;
    _ttsService.onError = _handleError;
    _ttsService.onVoicesChanged = _handleVoicesChanged;
  }

  /// Initializes the underlying `TtsService`.
  /// This must be called from the UI (e.g., in `initState`) before using the controller.
  Future<void> initialize() async {
    try {
      await _ttsService.initialize();
      // If initialization was successful, the state remains `initial`.
      // If it fails, the error will be stored in `initializationError`.
    } catch (e) {
      _errorMessage = e.toString();
      _ttsState = TtsState.error;
    }
    notifyListeners();
  }

  // --- Public Methods to Control Playback ---

  /// Speaks the text provided via `setTextToSpeak`.
  /// If playback was paused, it will resume from where it left off.
  Future<void> speak() async {
    if (!isInitialized || _text.trim().isEmpty) return;

    // If resuming from a paused state, just continue the loop.
    if (_ttsState != TtsState.paused) {
      _resetPlaybackState();
      _sentenceQueue = splitIntoSentences(_text);
      if (_sentenceQueue.isEmpty) return;
    }

    _ttsState = TtsState.playing;
    notifyListeners(); // Notify UI that playback has started.

    await _speakNextSentence();
  }

  /// Pauses the current playback. State is preserved to be resumed later.
  Future<void> pause() async {
    if (_ttsState != TtsState.playing) return;
    _ttsState = TtsState.paused;
    await _ttsService.stop(); // Immediately stops the speech engine.
    notifyListeners();
  }

  /// Stops playback completely and resets the state.
  Future<void> stop() async {
    if (isStopped) return;
    _ttsState = TtsState.stopped;
    await _ttsService.stop();
    _resetPlaybackState(notify: true);
  }

  /// Updates the text to be spoken. If playback is active, it will be stopped.
  void setTextToSpeak(String newText) {
    if (_text == newText) return;
    _text = newText;
    _sentenceList = splitIntoSentences(_text);

    if (isPlaying || isPaused) {
      stop(); // Stop and reset if the text changes during playback.
    }
  }

  // --- Public Methods to Configure Settings ---

  /// Changes the target language for this controller.
  void setLanguage(String newLanguageCode) {
    if (_languageCode == newLanguageCode) return;
    _languageCode = newLanguageCode;
    // The language will be automatically switched by the TtsService
    // on the next call to `speak`.
    notifyListeners();
  }

  /// Proxies to `TtsService` to set the speech volume.
  Future<void> setVolume(double value) async {
    await _ttsService.setVolume(value);
    notifyListeners();
  }

  /// Proxies to `TtsService` to set the speech pitch.
  Future<void> setPitch(double value) async {
    await _ttsService.setPitch(value);
    notifyListeners();
  }

  /// Proxies to `TtsService` to set the speech rate.
  Future<void> setSpeechRate(double value) async {
    await _ttsService.setSpeechRate(value);
    notifyListeners();
  }

  /// Resets all speech parameters (volume, pitch, rate) to their defaults.
  Future<void> resetSpeechParameters() async {
    await _ttsService.resetSpeechParameters();
    notifyListeners();
  }

  /// Toggles sentence highlighting on or off.
  void enableHighlighting(bool enable) {
    if (_isHighlightingEnabled == enable) return;
    _isHighlightingEnabled = enable;
    if (!enable) {
      _resetHighlighting(notify: true);
    } else {
      notifyListeners();
    }
  }

  // --- Private Handlers for TtsService Callbacks ---

  void _handleStart() {
    // If the state is not 'playing', it means a pause/stop command was issued
    // just before the engine started. We should honor that command.
    if (_ttsState != TtsState.playing) {
      _ttsService.stop();
      return;
    }

    if (_isHighlightingEnabled) {
      final currentSentence = _sentenceQueue[_currentSentenceIndex];
      _highlightStartOffset = currentSentence.startOffset;
      _highlightEndOffset = currentSentence.endOffset;
      notifyListeners();
    }
  }

  void _handleCompletion() {
    if (_ttsState != TtsState.playing) {
      _resetHighlighting(notify: true);
      return;
    }

    _currentSentenceIndex++;
    if (_currentSentenceIndex < _sentenceQueue.length) {
      _speakNextSentence();
    } else {
      // Reached the end of the text.
      _ttsState = TtsState.stopped;
      _resetPlaybackState(notify: true);
    }
  }

  void _handleError(String message) {
    _errorMessage = "Playback Error: $message";
    _ttsState = TtsState.error;
    _resetPlaybackState(notify: true);
  }

  /// Called when the underlying list of system voices changes (mainly for web).
  void _handleVoicesChanged() {
    // The UI might want to refresh its list of available voices.
    notifyListeners();
  }

  // --- Private Helper Methods ---

  Future<void> _speakNextSentence() async {
    if (_currentSentenceIndex < _sentenceQueue.length) {
      final sentence = _sentenceQueue[_currentSentenceIndex].text;
      await _ttsService.speak(sentence, languageCode: _languageCode);
    }
  }

  /// Resets only the highlighting state.
  void _resetHighlighting({bool notify = false}) {
    if (_highlightStartOffset != -1 || _highlightEndOffset != -1) {
      _highlightStartOffset = -1;
      _highlightEndOffset = -1;
      if (notify) notifyListeners();
    }
  }

  /// Resets the entire playback queue and highlighting.
  void _resetPlaybackState({bool notify = false}) {
    _resetHighlighting();
    _sentenceQueue.clear();
    _currentSentenceIndex = 0;
    if (notify) notifyListeners();
  }

  @override
  void dispose() {
    // We do not dispose the TtsService here, as it might be shared
    // across multiple controllers. The creator of the TtsService is responsible
    // for its lifecycle.
    _ttsService.onStart = null;
    _ttsService.onCompletion = null;
    _ttsService.onError = null;
    _ttsService.onVoicesChanged = null;
    super.dispose();
  }
}
