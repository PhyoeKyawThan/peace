import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class LessonTitle extends StatelessWidget {
  final String title;
  final double maxWidth;

  const LessonTitle({super.key, required this.title, required this.maxWidth});

  @override
  Widget build(BuildContext context) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    final bool isOverflowing = textPainter.width > maxWidth;

    return SizedBox(
      height: 50,
      width: maxWidth,
      child: isOverflowing
          ? Marquee(
              text: title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              blankSpace: 40,
              velocity: 50,
              startPadding: 10,
              accelerationDuration: Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration: Duration(seconds: 1),
              decelerationCurve: Curves.easeOut,
            )
          : Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
    );
  }
}
