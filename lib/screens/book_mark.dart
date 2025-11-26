import 'package:flutter/material.dart';
import 'package:mind_peace/constants/colors.dart';
import 'package:mind_peace/dialogs/lesson_item_dialog.dart';
import 'package:mind_peace/models/dialog_model.dart';
import 'package:mind_peace/models/lesson_model.dart';
import 'package:mind_peace/services/audio_service.dart';
import 'package:mind_peace/widgets/home_top_player.dart';
import 'package:provider/provider.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  @override
  Widget build(BuildContext context) {
    final audioService = context.watch<MyAudioService>();
    List<Lesson> bookMarks = audioService.lessonList
        .where((item) => item.isBookMark)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "မှတ်ထားသည့် တရားတော်များ",
          style: TextStyle(
            color: AppColors.accentDark,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          audioService.isPlaying
              ? HomeTopPlayer(lesson: audioService.currentPlayingLesson)
              : SizedBox.shrink(),
          bookMarks.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bookmark,
                        size: 50,
                        color: AppColors.accentDark,
                      ),
                      Text(
                        "There is no bookmarks at this moment.",
                        style: TextStyle(
                          color: AppColors.accentDark,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: bookMarks.length,
                    itemBuilder: (context, index) {
                      final lesson = bookMarks[index];
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
                          onPressed: () =>
                              audioService.setBookMark(index, id: lesson.id),
                          icon: Icon(Icons.bookmark),
                        ),
                        iconColor: lesson.isBookMark
                            ? AppColors.primaryDark
                            : AppColors.textPrimaryLight,
                        onTap: () async {
                          final dialogAction = await lessonItemDialog(
                            context,
                            lesson,
                          );
                          if (dialogAction == LessonDialogAction.listen) {
                            await audioService.play(
                              lesson.audioPath,
                              index: index,
                              lesson: lesson,
                            );
                          }
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
