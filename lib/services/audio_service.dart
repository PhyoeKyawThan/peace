import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
import 'package:mind_peace/handler/audio_handler.dart';
import 'package:mind_peace/helpers/database_helper.dart';
import 'package:mind_peace/models/lesson_model.dart';

class MyAudioService extends ChangeNotifier {
  int _currentIndex = -1;
  Lesson? _currentPlayingLesson;
  List<Lesson> _lessonList = [];
  List<Lesson> _bookMarkList = [];

  final MyAudioHandler handler;
  MyAudioService({required this.handler}) {
    handler.playerStateStream.listen((state) {
      notifyListeners();
    });
  }

  MyAudioHandler get player => handler;
  int get currentIndex => _currentIndex;
  bool get isPlaying => handler.isPlaying;
  Lesson? get currentPlayingLesson => _currentPlayingLesson;
  List<Lesson> get lessonList => _lessonList;
  List<Lesson> get bookMarkList => _bookMarkList;

  Future<void> loadLessons() async {
    _lessonList = await DatabaseHelper.instance.getAllLessons();
    notifyListeners();
  }

  Future<void> loadBookMark() async {
    _bookMarkList = await DatabaseHelper.instance.getBookMark();
    notifyListeners();
  }

  Future<void> play(String path, {int? index, Lesson? lesson}) async {
    await handler.setAsset(path);
    await handler.play();
    if (index != null) {
      _currentIndex = index;
    }
    if (lesson != null) {
      _currentPlayingLesson = lesson;
      handler.addMediaItem(lesson);
    }
    await DatabaseHelper.instance.saveTrack(_currentIndex, 0);
    notifyListeners();
  }

  Future<void> pause() async {
    await handler.pause();
    await DatabaseHelper.instance.saveTrack(
      _currentIndex,
      handler.position.inMilliseconds,
    );
    notifyListeners();
  }

  Future<void> resume() async {
    await handler.play();
    notifyListeners();
  }

  Future<void> togglePlay() async {
    isPlaying ? await handler.pause() : await handler.play();
  }

  Future<void> playNext() async {
    if (_lessonList.isEmpty) return;
    _currentIndex = (_currentIndex + 1) % _lessonList.length;
    Lesson lesson = _lessonList[_currentIndex];
    await play(lesson.audioPath, lesson: lesson);
  }

  Future<void> playPrevious() async {
    if (_lessonList.isEmpty) return;
    _currentIndex =
        (_currentIndex - 1 + _lessonList.length) % _lessonList.length;
    Lesson lesson = _lessonList[_currentIndex];
    await play(lesson.audioPath, lesson: lesson);
  }

  Future<void> setBookMark(int index, {int? id}) async {
    if (id != null) {
      index = _lessonList.indexWhere((l) => l.id == id);
    }
    final lesson = _lessonList[index];
    lesson.isBookMark = !lesson.isBookMark;
    _lessonList[index] = lesson;

    notifyListeners();
    await DatabaseHelper.instance.updateLesson(lesson);
  }

  Future<void> stop() async {
    await handler.stop();

    notifyListeners();
  }

  Future<void> seek(Duration position) async {
    await handler.seek(position);
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
      await handler.setAsset(_currentPlayingLesson!.audioPath);
      await handler.seek(Duration(milliseconds: lastSeek));
    }

    notifyListeners();
  }

  @override
  void dispose() {
    DatabaseHelper.instance.saveTrack(
      currentIndex,
      handler.position.inMilliseconds,
    );
    super.dispose();
  }
}
