import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mind_peace/helpers/database_helper.dart';
import 'package:mind_peace/models/lesson_model.dart';

class AudioService extends ChangeNotifier {
  int _currentIndex = -1;
  Lesson? _currentPlayingLesson;
  List<Lesson> _lessonList = [];

  final AudioPlayer _player = AudioPlayer();
  AudioService() {
    _player.playerStateStream.listen((state) {
      notifyListeners();
    });
  }

  AudioPlayer get player => _player;
  int get currentIndex => _currentIndex;
  bool get isPlaying => _player.playerState.playing;
  Lesson? get currentPlayingLesson => _currentPlayingLesson;
  List<Lesson> get lessonList => _lessonList;

  Future<void> loadLessons() async {
    _lessonList = await DatabaseHelper.instance.getAllLessons();
    notifyListeners();
  }

  Future<void> play(String path, {int? index, Lesson? lesson}) async {
    await _player.setAsset(path);
    await _player.play();

    if (index != null) {
      _currentIndex = index;
    }
    if (lesson != null) {
      _currentPlayingLesson = lesson;
    }
    await DatabaseHelper.instance.saveTrack(_currentIndex, 0);
    notifyListeners();
  }

  Future<void> pause() async {
    await _player.pause();
    await DatabaseHelper.instance.saveTrack(
      _currentIndex,
      _player.position.inMilliseconds,
    );
    notifyListeners();
  }

  Future<void> resume() async {
    await _player.play();
    notifyListeners();
  }

  Future<void> setFav(int index) async {
    final lesson = _lessonList[index];
    lesson.isFav = !lesson.isFav;
    _lessonList[index] = lesson;
    notifyListeners();
    await DatabaseHelper.instance.updateLesson(lesson);
  }

  Future<void> stop() async {
    await _player.stop();

    notifyListeners();
  }

  Future<void> seek(Duration position) async {
    await _player.seek(position);
    await DatabaseHelper.instance.saveTrack(
      _currentIndex,
      position.inMilliseconds,
    );
    notifyListeners();
  }

  Future<void> loadLastTrack() async {
    _lessonList = await DatabaseHelper.instance.getAllLessons();

    final track = await DatabaseHelper.instance.loadTrack();
    _currentIndex = track['currentIndex'] ?? 0;
    final lastSeek = track['seek'] ?? 0;
    if (_lessonList.isNotEmpty && _currentIndex < _lessonList.length) {
      _currentPlayingLesson = _lessonList[_currentIndex];
      await _player.setAsset(_currentPlayingLesson!.audioPath);
      await _player.seek(Duration(milliseconds: lastSeek));
    }

    notifyListeners();
  }

  @override
  void dispose() {
    DatabaseHelper.instance.saveTrack(
      currentIndex,
      _player.position.inMilliseconds,
    );
    _player.dispose();
    super.dispose();
  }
}
