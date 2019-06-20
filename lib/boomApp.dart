import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:boomenglish/utilite/result_code.dart';
import 'package:boomenglish/utilite/result_model.dart';
import 'package:boomenglish/module/login/login.dart';

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
    _initData();

    _listenToAuth();
  }

  static SlideTransition createTransition(
      Animation<double> animation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child,
    );
  }
  // 监听网络请求 统一处理toast 和 登录跳转
  void _listenToAuth() {
    ResultCode.eventBus.on<ResultErrorEvent>().listen((event) {
      Fluttertoast.showToast(
          msg: event.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Color(0xff9e9e9e),
          textColor: Color(0xffffffff));
      if (event.code == 403) {
        Navigator.push(
            context,
            PageRouteBuilder(pageBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return Login();
            }, transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              return BoomAppState.createTransition(animation, child);
            }));
      }
    });
  }

  void _initData() {
    _tabImages = [
      [
        _getTabImage('assets/images/TabBar_Home_Normal.png'),
        _getTabImage('assets/images/TabBar_Home_Selected.png')
      ],
      [
        _getTabImage('assets/images/TabBar_Course_Normal.png'),
        _getTabImage('assets/images/TabBar_Course_Selected.png')
      ],
      [
        _getTabImage('assets/images/TabBar_Word_Normal.png'),
        _getTabImage('assets/images/TabBar_Word_Selected.png')
      ],
      [
        _getTabImage('assets/images/TabBar_Mine_Normal.png'),
        _getTabImage('assets/images/TabBar_Mine_Selected.png')
      ]
    ];

    _pages = [Home(), CourseMain(), WordMain(), Mine()];
  }

  Image _getTabImage(path) {
    return Image.asset(path, width: 20.0, height: 20.0);
  }

  Image _getTabIcon(int curIndex) {
    if (curIndex == _selectedIndex) {
      return _tabImages[curIndex][1];
    }
    return _tabImages[curIndex][0];
  }

  Text _getTabTitle(int curIndex) {
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
        body: IndexedStack(
          //重载解决办法
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _appBarTitles
              .asMap()
              .keys
              .map((index) => BottomNavigationBarItem(
                  icon: _getTabIcon(index), title: _getTabTitle(index)))
              .toList(),
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
