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
      selectedItemColor: AppColors.accentDark,
      items: [
        _buildItem("ပင်မစာမျက်နှာ", Icon(Icons.home)),
        _buildItem("တရားတော်များ", Icon(Icons.temple_buddhist)),
        _buildItem("မှတ်ထားသည်များ", Icon(Icons.bookmark)),
        // _buildItem("တရားထည့်ရန်", Icon(Icons.save_as_rounded)),
      ],
      onTap: (index) => handler(index),
    );
  }

  BottomNavigationBarItem _buildItem(String title, Icon icon) {
    return BottomNavigationBarItem(icon: icon, label: title);
  }
}
