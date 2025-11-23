import 'package:flutter/material.dart';
import 'package:mind_peace/constants/colors.dart';
import 'package:mind_peace/models/lesson_model.dart';

class HomeTopPlayer extends StatefulWidget {
  final Lesson? lesson;
  const HomeTopPlayer({super.key, required this.lesson});

  @override
  State<HomeTopPlayer> createState() => _HomeTopPlayerState();
}

class _HomeTopPlayerState extends State<HomeTopPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.highlightDark,
      height: 50,
      child: Center(
        child: Text("နာကြားနေသည် - ${widget.lesson?.title ?? "Unknown"}"),
      ),
    );
  }
}
