import 'package:flutter/material.dart';
import 'package:mind_peace/constants/colors.dart';
// import 'package:mind_peace/dialogs/lesson_item_dialog.dart';
// import 'package:mind_peace/models/dialog_model.dart';
import 'package:mind_peace/screens/single_lesson_view.dart';
import 'package:mind_peace/services/audio_service.dart';
import 'package:mind_peace/widgets/home_top_player.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final audioService = context.watch<MyAudioService>();
    return Scaffold(
      appBar: AppBar(title: Text("တရားတော်များ")),
      body: Column(
        children: [
          audioService.isPlaying
              ? HomeTopPlayer(lesson: audioService.currentPlayingLesson)
              : SizedBox.shrink(),
          Expanded(
            child: ListView.builder(
              itemCount: audioService.lessonList.length,
              itemBuilder: (BuildContext context, int index) {
                final lesson = audioService.lessonList[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(50),
                    child: Image.asset(
                      "assets/images/default.jpg",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(lesson.title),
                  subtitle: Text(lesson.sayartaw),
                  textColor: AppColors.accentDark,
                  trailing: IconButton(
                    onPressed: () => audioService.setBookMark(index),
                    icon: Icon(Icons.bookmark),
                  ),
                  iconColor: lesson.isBookMark
                      ? AppColors.primaryDark
                      : AppColors.textPrimaryLight,
                  onTap: () {
                    // final dialogAction = await lessonItemDialog(
                    //   context,
                    //   lesson,
                    // );
                    // if (dialogAction == LessonDialogAction.listen) {
                    audioService.play(
                      lesson.audioPath,
                      index: index,
                      lesson: lesson,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SingleLessonView(lesson: lesson),
                      ),
                    );
                    // }
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: audioService.currentIndex >= 0
          ? IconButton(
              onPressed: () async {
                if (audioService.isPlaying) {
                  await audioService.pause();
                } else {
                  await audioService.resume();
                }
              },
              icon: Icon(
                audioService.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  AppColors.primaryLight,
                ),
                padding: WidgetStateProperty.all(EdgeInsets.all(8)),
              ),
            )
          : null,
    );
  }
}
