import 'package:just_audio/just_audio.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';

class SoundService {
  late AudioPlayer _correctPlayer;
  late AudioPlayer _wrongPlayer;
  late AudioPlayer _popPlayer;

  SoundService() {
    _correctPlayer = AudioPlayer();
    _wrongPlayer = AudioPlayer();
    _popPlayer = AudioPlayer();
    _initPlayers();
  }

  Future<void> _initPlayers() async {
    try {
      // Load correct answer sound
      await _correctPlayer.setAsset('assets/sounds/correct_answer.mp3');
      AppLogger.d('SoundService: Correct sound loaded.');

      // Load wrong answer sound
      await _wrongPlayer.setAsset('assets/sounds/incorrect_answer.mp3');
      AppLogger.d('SoundService: Wrong sound loaded.');

      // Load pop sound
      await _popPlayer.setAsset('assets/sounds/sharp_pop.mp3');
      AppLogger.d('SoundService: Pop sound loaded.');
    } catch (e) {
      AppLogger.e('SoundService: Error loading audio assets: $e');
    }
  }

  Future<void> playCorrectSound() async {
    try {
      await _correctPlayer.seek(Duration.zero);
      await _correctPlayer.play();
      AppLogger.d('SoundService: Played correct sound.');
    } catch (e) {
      AppLogger.e('SoundService: Error playing correct sound: $e');
    }
  }

  Future<void> playWrongSound() async {
    try {
      await _wrongPlayer.seek(Duration.zero);
      await _wrongPlayer.play();
      AppLogger.d('SoundService: Played wrong sound.');
    } catch (e) {
      AppLogger.e('SoundService: Error playing wrong sound: $e');
    }
  }

  Future<void> playPopSound() async {
    try {
      await _popPlayer.seek(Duration.zero);
      await _popPlayer.play();
      AppLogger.d('SoundService: Played pop sound.');
    } catch (e) {
      AppLogger.e('SoundService: Error playing pop sound: $e');
    }
  }

  void dispose() {
    _correctPlayer.dispose();
    _wrongPlayer.dispose();
    _popPlayer.dispose();
    AppLogger.i('SoundService: Disposed audio players.');
  }
}
