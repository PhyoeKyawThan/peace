import 'package:flutter/material.dart';
import 'package:mind_peace/constants/colors.dart';
import 'package:mind_peace/models/lesson_model.dart';
import 'package:mind_peace/screens/single_lesson_view.dart';

class HomeTopPlayer extends StatefulWidget {
  final Lesson? lesson;
  const HomeTopPlayer({super.key, required this.lesson});

  @override
  State<HomeTopPlayer> createState() => _HomeTopPlayerState();
}

class _HomeTopPlayerState extends State<HomeTopPlayer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => SingleLessonView(lesson: widget.lesson!),
        ),
      ),
      child: Container(
        color: AppColors.highlightDark,
        height: 50,
        child: Center(
          child: Text("နာကြားနေသည် - ${widget.lesson?.title ?? "Unknown"}"),
        ),
      ),
    );
  }
}
