import 'package:flutter/material.dart';
import 'package:mediped/home/dashboard.dart';
import 'package:mediped/screen/chat/chat.dart';
import 'package:mediped/screen/profile/profile.dart';
import 'package:mediped/screen/team/team.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final int currentPageIndex;
  final Function(int) onDestinationSelected;

  const BottomNavigationBarWidget({
    Key? key,
    required this.currentPageIndex,
    required this.onDestinationSelected,
  }) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();

}

class _BottomNavigationBarWidgetState
    extends State<BottomNavigationBarWidget> {

  void navigate(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatHome()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );

        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile()),
        );

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentPageIndex,
      onTap: (index) => navigate(index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
