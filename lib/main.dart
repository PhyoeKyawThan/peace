import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:mind_peace/constants/colors.dart';
import 'package:mind_peace/handler/audio_handler.dart';
import 'package:mind_peace/helpers/database_helper.dart';
import 'package:mind_peace/helpers/external_storage.dart';
import 'package:mind_peace/screens/book_mark.dart';
import 'package:mind_peace/services/audio_service.dart';
import 'package:mind_peace/screens/home.dart';
import 'package:mind_peace/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';

late MyAudioHandler audioHandler;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  audioHandler = await AudioService.init(
    builder: () => MyAudioHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.example.mind_peace',
      androidNotificationChannelName: 'Audio Playback',
      androidNotificationOngoing: true,
    ),
  );
  await prepareAudioFiles();
  runApp(
    ChangeNotifierProvider(
      create: (_) => MyAudioService(handler: audioHandler),
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

  final List<Widget> _screens = [
    HomeScreen(),
    BookMarkScreen(),
    // Text("New Add"),
  ];
  void _handler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    if (Provider.of<MyAudioService>(
      context,
      listen: false,
    ).lessonList.isEmpty) {
      Provider.of<MyAudioService>(context, listen: false).loadLessons();
    }
    _initAudioService();
    _initDefaultInsert();
  }

  Future<void> _initAudioService() async {
    final audioService = Provider.of<MyAudioService>(context, listen: false);
    await audioService.loadLastTrack();

    setState(() {});
  }

  Future<void> _initDefaultInsert() async {
    await DatabaseHelper.instance.initialDefaultInsert();
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
