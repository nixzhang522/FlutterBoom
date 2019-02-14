import 'package:flutter/material.dart';
import 'package:boomenglish/module/course/courseList.dart';

class CourseMain extends StatefulWidget {
  @override
  CourseState createState() => new CourseState();
}

class CourseState extends State<CourseMain>
    with SingleTickerProviderStateMixin {
  TabController mController;
  List<String> tabList;

  @override
  void initState() {
    super.initState();
    initTabData();
    mController = TabController(
      length: tabList.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    mController.dispose();
  }

  initTabData() {
    tabList = ['订阅', '网课', '影视'];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: new Color(0xffffffff),
          height: 44.0,
          margin: EdgeInsets.fromLTRB(15, 34, 0, 0),
          alignment: Alignment.centerLeft,
          child: TabBar(
            isScrollable: true,
            controller: mController,
            labelPadding: EdgeInsets.fromLTRB(0, 11, 10, 0),
            labelColor: Color(0xff222626),
            unselectedLabelColor: Color(0xff808080),
            labelStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
            indicatorColor: Color(0xfffcd433),
            indicatorWeight: 6,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.fromLTRB(0, 0, 10, 10),
            tabs: tabList.map((item) {
              return Tab(
                text: item,
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: mController,
            children: tabList.map((item) {
              if (item == "订阅") {
                return CourseList(url: "movie_class",);
              }
              else if (item == "网课") {
                return CourseList(url: "online_class",);
              }
              else {
                return CourseList(url: "movie_class",);
              }
            }).toList(),
          ),
        )
      ],
    );
  }
}
