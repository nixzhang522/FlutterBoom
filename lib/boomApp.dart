import 'package:flutter/material.dart';

import 'package:boomenglish/module/home/home.dart';
import 'package:boomenglish/module/course/course_main/course_main.dart';
import 'package:boomenglish/module/word/word_main.dart';
import 'package:boomenglish/module/mine/mine.dart';

class BoomApp extends StatefulWidget {
  @override
  BoomAppState createState() => BoomAppState();
}

class BoomAppState extends State<BoomApp> {
  int _selectedIndex = 0;
  var _pages;
  var _tabImages;
  var _appBarTitles = ['首页', '课程', '单词', '我的'];

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() {
    _tabImages = [
      [
        getTabImage('assets/images/TabBar_Home_Normal.png'),
        getTabImage('assets/images/TabBar_Home_Selected.png')
      ],
      [
        getTabImage('assets/images/TabBar_Course_Normal.png'),
        getTabImage('assets/images/TabBar_Course_Selected.png')
      ],
      [
        getTabImage('assets/images/TabBar_Word_Normal.png'),
        getTabImage('assets/images/TabBar_Word_Selected.png')
      ],
      [
        getTabImage('assets/images/TabBar_Mine_Normal.png'),
        getTabImage('assets/images/TabBar_Mine_Selected.png')
      ]
    ];

    _pages = [Home(), CourseMain(), WordMain(), Mine()];
  }

  Image getTabImage(path) {
    return Image.asset(path, width: 20.0, height: 20.0);
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _selectedIndex) {
      return _tabImages[curIndex][1];
    }
    return _tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    if (curIndex == _selectedIndex) {
      return Text(_appBarTitles[curIndex],
          style: TextStyle(color: const Color(0xff222626)));
    } else {
      return Text(_appBarTitles[curIndex],
          style: TextStyle(color: const Color(0xff222626)));
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(0xffffffff)),
      home: Scaffold(
        body: IndexedStack(  //重载解决办法
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: getTabIcon(0), title: getTabTitle(0)),
            BottomNavigationBarItem(
                icon: getTabIcon(1), title: getTabTitle(1)),
            BottomNavigationBarItem(
                icon: getTabIcon(2), title: getTabTitle(2)),
            BottomNavigationBarItem(
                icon: getTabIcon(3), title: getTabTitle(3)),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
