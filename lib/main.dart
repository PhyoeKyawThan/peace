import 'package:flutter/material.dart';
import 'package:mind_peace/constants/colors.dart';
import 'package:mind_peace/screens/home.dart';
import 'package:mind_peace/widgets/bottom_navigation.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Buddhist Lessons',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Auto switches based on system settings
      home: MindPeace(),
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

  final List<Widget> _screens = [HomeScreen(), Text("this is list")];
  void _handler(int index) {
    setState(() {
      _currentIndex = index;
    });
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
