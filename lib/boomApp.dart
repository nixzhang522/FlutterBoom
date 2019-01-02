import 'package:flutter/material.dart';

import 'package:boomenglish/module/home/home.dart';
import 'package:boomenglish/module/course/courseMain.dart';
import 'package:boomenglish/module/word/wordMain.dart';
import 'package:boomenglish/module/mine/mine.dart';

// class BoomApp extends StatefulWidget {
//   @override
//   BoomAppState createState() => new BoomAppState();
// }

// class BoomAppState extends State<BoomApp> with SingleTickerProviderStateMixin {

//   TabController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = new TabController(length: 4, vsync: this);
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: new Scaffold(
//         body: new TabBarView(
//           controller: controller,
//           children: [
//             new Home(),
//             new CourseMain(),
//             new WordMain(),
//             new Mine(),
//           ],
//         ),
//         bottomNavigationBar: new Material(
//           color: Colors.white,
//           child: new TabBar(
//             controller: controller,
//             indicatorColor: Colors.white,
//             unselectedLabelColor: Color(0xff808080),
//             labelColor: Color(0xff222626),
//             tabs: [
//               new Tab(
//                 text: "首页",
//                 icon: new Image.asset("assets/images/TabBar_Home_Normal.png", width: 20, height: 20,),
//               ),
//               new Tab(
//                 text: "课程",
//                 icon: new Image.asset("assets/images/TabBar_Course_Normal.png", width: 20, height: 20,),
//               ),
//               new Tab(
//                 text: "单词",
//                 icon: new Image.asset("assets/images/TabBar_Word_Normal.png", width: 20, height: 20,),
//               ),
//               new Tab(
//                 text: "我的",
//                 icon: new Image.asset("assets/images/TabBar_Mine_Normal.png", width: 20, height: 20,),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class BoomApp extends StatefulWidget {
  @override
  BoomAppState createState() => new BoomAppState();
}

class BoomAppState extends State<BoomApp> {
  int _tabIndex = 0;
  var _pages;
  var tabImages;
  var appBarTitles = ['首页', '课程', '单词', '我的'];

  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(color: const Color(0xff222626)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(color: const Color(0xff808080)));
    }
  }

  void initData() {
    tabImages = [
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

    _pages = [new Home(), new CourseMain(), new WordMain(), new Mine()];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return new MaterialApp(
      home: new Scaffold(
        body: _pages[_tabIndex],
        bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
            new BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
            new BottomNavigationBarItem(icon: getTabIcon(2), title: getTabTitle(2)),
            new BottomNavigationBarItem(icon: getTabIcon(3), title: getTabTitle(3)),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _tabIndex,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
      )
    );
  }


  
}
