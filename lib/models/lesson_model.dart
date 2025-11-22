class Lesson {
  final String title;
  final String sayawtaw;
  final String description;
  final String audioPath;
  final String srtPath;
  final String imagePath;
  final bool isFav;

  Lesson({
    required this.title,
    required this.sayawtaw,
    required this.description,
    required this.audioPath,
    required this.srtPath,
    required this.imagePath,
    required this.isFav,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      title: json['title'],
      sayawtaw: json['sayawtaw'],
      description: json['description'],
      audioPath: json['audioPath'],
      srtPath: json['srtPath'],
      imagePath: json['imagePath'],
      isFav: json['isFav'],
    );
  }

  static Map<String, dynamic> toMap(Lesson lesson) {
    return {
      "title": lesson.title,
      "sayartaw": lesson.sayawtaw,
      "description": lesson.description,
      "audioPath": lesson.audioPath,
      "srtPath": lesson.srtPath,
      "imagePath": lesson.imagePath,
      "isFav": lesson.isFav,
    };
  }
}
