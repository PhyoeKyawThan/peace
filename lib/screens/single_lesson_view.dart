import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:mind_peace/constants/colors.dart';
import 'package:mind_peace/models/lesson_model.dart';
import 'package:mind_peace/services/audio_service.dart';
import 'package:provider/provider.dart';
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
    final audioService = context.watch<MyAudioService>();
    Lesson lesson = audioService.currentPlayingLesson!;
    return Scaffold(
      appBar: AppBar(title: Text(lesson.title), centerTitle: true),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.secondaryLight,
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20),
              child: Image.asset(
                "assets/images/default.jpg",
                width: MediaQuery.of(context).size.width * 0.9,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 50,
              child: Marquee(
                text: lesson.title,
                style: TextStyle(
                  fontSize: 20,
                  // color: const Color.fromARGB(255, 248, 213, 213),
                  fontWeight: FontWeight.bold,
                ),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                blankSpace: 40,
                velocity: 50,
                startPadding: 10,
                accelerationDuration: Duration(seconds: 1),
                accelerationCurve: Curves.linear,
                decelerationDuration: Duration(seconds: 1),
                decelerationCurve: Curves.easeOut,
              ),
            ),
            Text(
              lesson.sayartaw,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textPrimaryLight,
                fontWeight: FontWeight.w100,
              ),
            ),

            // SingleChildScrollView(
            //   child: Column(
            //     children: [Text("aasf"), Text("asfasdf"), Text("afdasd")],
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 120,
        color: AppColors.secondaryLight,
        // color: Colors.black,
        child: Row(
          mainAxisAlignment: .spaceEvenly,
          children: [
            IconButton(
              onPressed: () async {
                await audioService.playPrevious();
              },
              icon: Icon(
                Icons.skip_previous,
                size: 40,
                color: AppColors.accentLight,
              ),
            ),
            IconButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  AppColors.backgroundLight,
                ),
              ),
              onPressed: () async {
                await audioService.togglePlay();
              },
              icon: Icon(
                audioService.isPlaying ? Icons.pause : Icons.play_arrow,
                size: 50,
                color: AppColors.accentLight,
              ),
            ),
            IconButton(
              onPressed: () async {
                await audioService.playNext();
              },
              icon: Icon(
                Icons.skip_next,
                size: 40,
                color: AppColors.accentLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
