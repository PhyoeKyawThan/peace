import 'package:flutter/material.dart';
import 'package:mind_peace/constants/colors.dart';
import 'package:mind_peace/models/lesson_model.dart';
// import 'package:mind_peace/services/audio_service.dart';

class SingleLessonView extends StatefulWidget {
  final Lesson lesson;
  const SingleLessonView({super.key, required this.lesson});

  @override
  State<SingleLessonView> createState() => _SingleLessonViewState();
}

class _SingleLessonViewState extends State<SingleLessonView> {
  @override
  Widget build(BuildContext context) {
    Lesson lesson = widget.lesson;
    return Scaffold(
      appBar: AppBar(title: Text(lesson.title), centerTitle: true),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.secondaryLight,
        child: Column(
          children: [
            SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20),
              child: Image.asset(
                "assets/images/default.jpg",
                width: MediaQuery.of(context).size.width * 0.9,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              lesson.title,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.textPrimaryLight,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3),
            Text(
              lesson.sayartaw,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textPrimaryLight,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              child: Column(
                children: [Text("aasf"), Text("asfasdf"), Text("afdasd")],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
