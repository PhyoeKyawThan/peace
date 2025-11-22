import 'package:flutter/material.dart';
import 'package:mind_peace/constants/colors.dart';
import 'package:mind_peace/dialogs/lesson_item_dialog.dart';
import 'package:mind_peace/examples/dataset.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("တရားတော်များ")),
      body: ListView.builder(
        itemCount: lessonList.length,
        itemBuilder: (BuildContext context, int index) {
          final lesson = lessonList[index];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(50),
              child: Image.asset(
                "assets/images/pexels-paperpeacock-1585716.jpg",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(lesson.title),
            subtitle: Text(lesson.sayawtaw),
            textColor: AppColors.accentDark,
            trailing: Icon(Icons.bookmark),
            iconColor: lesson.isFav
                ? AppColors.primaryDark
                : AppColors.textPrimaryLight,
            onTap: () async {
              final ok = await lessonItemDialog(context, lesson);
              print(ok!.name);
            },
          );
        },
      ),
    );
  }
}
