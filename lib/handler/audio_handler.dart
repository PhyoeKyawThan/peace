import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mind_peace/helpers/external_storage.dart';
import 'package:mind_peace/models/lesson_model.dart';

class MyAudioHandler extends BaseAudioHandler {
  final AudioPlayer _player = AudioPlayer();

  MyAudioHandler() {
    // Only this line is enough to update playbackState from just_audio
    _player.playbackEventStream.map(_transformEvent).pipe(playbackState);
  }

  Future<void> setFilePath(String filePath) async {
    final audioDir = await initAudioFolder();
    await _player.setFilePath("$audioDir/$filePath");
  }

  void addMediaItem(Lesson lesson) {
    mediaItem.add(
      MediaItem(
        id: "${lesson.id}",
        title: lesson.title,
        artist: lesson.sayartaw,
      ),
    );
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> stop() => _player.stop();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  Stream<PlayerState> get playerStateStream => _player.playerStateStream;

  Duration get position => _player.position;

  bool get isPlaying => _player.playing;

  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: [
        !_player.playing ? MediaControl.play : MediaControl.pause,
        MediaControl.stop,
      ],
      androidCompactActionIndices: const [0, 1, 2],
      processingState: _mapProcessingState(_player.processingState),
      playing: _player.playing,
      updatePosition: _player.position,
      bufferedPosition: _player.bufferedPosition,
      speed: _player.speed,
      queueIndex: 0,
    );
  }

  AudioProcessingState _mapProcessingState(ProcessingState state) {
    switch (state) {
      case ProcessingState.idle:
        return AudioProcessingState.idle;
      case ProcessingState.loading:
        return AudioProcessingState.loading;
      case ProcessingState.buffering:
        return AudioProcessingState.buffering;
      case ProcessingState.ready:
        return AudioProcessingState.ready;
      case ProcessingState.completed:
        return AudioProcessingState.completed;
    }
  }
}
