import 'package:flutter/material.dart';
import 'package:mind_peace/constants/colors.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) handler;
  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.handler,
  });
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      items: [
        _buildItem("Home", Icon(Icons.home)),
        _buildItem(
          "Book Mark",
          Icon(Icons.bookmark, color: AppColors.highlightDark),
        ),
      ],
      onTap: (index) => handler(index),
    );
  }

  BottomNavigationBarItem _buildItem(String title, Icon icon) {
    return BottomNavigationBarItem(icon: icon, label: title);
  }
}
