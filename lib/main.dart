import 'package:flutter/material.dart';
import 'package:mind_peace/constants/colors.dart';
import 'package:mind_peace/screens/book_mark.dart';
import 'package:mind_peace/services/audio_service.dart';
import 'package:mind_peace/screens/home.dart';
import 'package:mind_peace/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AudioService(),
      child: MaterialApp(
        title: 'Buddhist Lessons',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        home: MindPeace(),
      ),
    ),
  );
}

class MindPeace extends StatefulWidget {
  const MindPeace({super.key});

  @override
  State<MindPeace> createState() => _MindPeaceState();
}

class _MindPeaceState extends State<MindPeace> {
  int _currentIndex = 0;

  final List<Widget> _screens = [HomeScreen(), BookMarkScreen()];
  void _handler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    if (Provider.of<AudioService>(context, listen: false).lessonList.isEmpty) {
      Provider.of<AudioService>(context, listen: false).loadLessons();
    }

    // if (Provider.of<AudioService>(
    //   context,
    //   listen: false,
    // ).bookMarkList.isEmpty) {
    //   Provider.of<AudioService>(context, listen: false).loadBookMark();
    // }
    _initAudioService();
  }

  Future<void> _initAudioService() async {
    final audioService = Provider.of<AudioService>(context, listen: false);
    await audioService.loadLastTrack();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        handler: _handler,
      ),
    );
  }
}
