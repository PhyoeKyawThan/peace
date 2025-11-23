class Lesson {
  final String title;
  final String sayartaw;
  final String description;
  final String audioPath;
  final String srtPath;
  final String imagePath;
  final bool isFav;

  Lesson({
    required this.title,
    required this.sayartaw,
    required this.description,
    required this.audioPath,
    required this.srtPath,
    required this.imagePath,
    required this.isFav,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      title: json['title']?.toString() ?? '',
      sayartaw: json['sayartaw']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      audioPath: json['audioPath']?.toString() ?? '',
      srtPath: json['srtPath']?.toString() ?? '',
      imagePath: json['imagePath']?.toString() ?? '',
      isFav: (json['isFav'] == 1) ? true : false,
    );
  }

  static Map<String, dynamic> toMap(Lesson lesson) {
    return {
      "title": lesson.title,
      "sayartaw": lesson.sayartaw,
      "description": lesson.description,
      "audioPath": lesson.audioPath,
      "srtPath": lesson.srtPath,
      "imagePath": lesson.imagePath,
      "isFav": lesson.isFav ? 1 : 0,
    };
  }
}
