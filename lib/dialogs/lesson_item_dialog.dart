import 'package:flutter/material.dart';
import 'package:mind_peace/constants/colors.dart';
import 'package:mind_peace/models/dialog_model.dart';
import 'package:mind_peace/models/lesson_model.dart';

Future<LessonDialogAction?> lessonItemDialog(
  BuildContext context,
  Lesson lesson,
) {
  return showDialog(
    context: context,
    builder: (_) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // IconButton(onPressed: () {}, icon: Icon(Icons.close)),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/pexels-paperpeacock-1585716.jpg",
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              lesson.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: double.infinity),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: const Color.fromARGB(96, 255, 214, 79),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        lesson.description,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textPrimaryLight,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryDark,
                  ),
                  onPressed: () {
                    Navigator.pop(context, LessonDialogAction.listen);
                  },
                  child: Text(
                    "တရားနာရန်",
                    style: TextStyle(color: AppColors.accentDark),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, LessonDialogAction.close);
                  },
                  child: Text(
                    "ပိတ်ရန်",
                    style: TextStyle(color: AppColors.accentDark),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
