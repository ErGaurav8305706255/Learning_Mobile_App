import 'package:flutter/material.dart';
import 'package:learning_mobile_app/constant/color_constant.dart';
import 'package:learning_mobile_app/constant/icon_constant.dart';
import 'package:learning_mobile_app/profile_screen.dart';

import 'course_screen.dart';
import 'home_screen.dart';
import 'more_screen.dart';
import 'notification_screen.dart';
class BottomNavigatorScreen extends StatefulWidget {
  const BottomNavigatorScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorScreen> createState() => _BottomNavigatorScreenState();
}

class _BottomNavigatorScreenState extends State<BottomNavigatorScreen> {

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CourseScreen(),
    ProfileScreen(),
    NotificationScreen(),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label:'Home',
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label:'Course',
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label:'Profile',
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important),
            label:'Notification',
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_vert,),
            label:'More',
            backgroundColor: Colors.teal,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorConstants.buttonColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
