import 'dart:async';
import 'package:mind_peace/examples/dataset.dart';
import 'package:mind_peace/models/lesson_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    if (_database != null) {
      _initialDefaultInsert();
    }
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'lessons.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // Create table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE lessons (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        sayartaw TEXT NOT NULL,
        description TEXT NOT NULL,
        audioPath TEXT NOT NULL,
        srtPath TEXT NOT NULL,
        imagePath TEXT NOT NULL,
        isFav INTEGER NOT NULL
      )
    ''');
    await db.execute('''
    CREATE TABLE track (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      currentIndex INTEGER NOT NULL,
      seek INTEGER NOT NULL
    )
  ''');
    await db.insert('track', {'currentIndex': 0, 'seek': 0});
  }

  // Insert a lesson
  Future<int> insertLesson(Lesson lesson) async {
    Database db = await instance.database;
    return await db.insert(
      'lessons',
      Lesson.toMap(lesson),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> _initialDefaultInsert() async {
    if (!await _checkLessonExists()) {
      for (Lesson lesson in lessonList) {
        await insertLesson(lesson);
      }
    }
  }

  Future<List<Lesson>> getAllLessons() async {
    Database db = await instance.database;
    final lessons = await db.query('lessons');
    return lessons.map((json) => Lesson.fromJson(json)).toList();
  }

  Future<bool> _checkLessonExists() async {
    Database db = await instance.database;
    final lessonCount = await db.rawQuery(
      "SELECT COUNT(*) as lesson_count FROM lessons",
    );
    int count = Sqflite.firstIntValue(lessonCount) ?? 0;
    return count > 0;
  }

  Future<int> updateLesson(Lesson lesson) async {
    Database db = await instance.database;
    return await db.update(
      'lessons',
      Lesson.toMap(lesson),
      where: 'id = ?',
      whereArgs: [lesson.id],
    );
  }

  Future<int> deleteLesson(int id) async {
    Database db = await instance.database;
    return await db.delete('lessons', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> saveTrack(int currentIndex, int seek) async {
    final db = await database;
    return await db.update(
      'track',
      {'currentIndex': currentIndex, 'seek': seek},
      where: 'id = ?',
      whereArgs: [1],
    );
  }

  Future<Map<String, int>> loadTrack() async {
    final db = await database;
    final result = await db.query('track', where: 'id = ?', whereArgs: [1]);
    if (result.isNotEmpty) {
      return {
        'currentIndex': result.first['currentIndex'] as int,
        'seek': result.first['seek'] as int,
      };
    } else {
      return {'currentIndex': 0, 'seek': 0};
    }
  }
}
