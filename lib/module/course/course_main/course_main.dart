import 'package:flutter/material.dart';

import 'package:boomenglish/utilite/request_manager.dart';
import 'package:boomenglish/utilite/result_model.dart';

import 'course_list.dart';

class CourseMain extends StatefulWidget {
  @override
  CourseState createState() => CourseState();
}

class CourseState extends State<CourseMain>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List _menus = [];

  @override
  void initState() {
    super.initState();
    _requestData();

    _tabController = TabController(
      length: _menus.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future _requestData() async {
    ResultModel resultModel =
        await RequestManager.get("/v1/scenario/catalog_list/", {});
    var data = resultModel.data['data'];
    var menus = data["categories"];

    setState(() {
      _menus = menus;
    });

    _tabController = TabController(
      length: _menus.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {

    double _statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: null,
      body: Column(
        children: <Widget>[
          Container(
            color: Color(0xffffffff),
            height: 44.0,
            margin: EdgeInsets.fromLTRB(15, _statusBarHeight, 0, 0),
            alignment: Alignment.centerLeft,
            child: TabBar(
              isScrollable: true,
              controller: _tabController,
              labelPadding: EdgeInsets.fromLTRB(0, 11, 10, 0),
              labelColor: Color(0xff222626),
              unselectedLabelColor: Color(0xff808080),
              labelStyle:
                  TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              indicatorColor: Color(0xfffcd433),
              indicatorWeight: 6,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.fromLTRB(0, 0, 10, 10),
              tabs: _menus.map((item) {
                return Tab(
                  text: item["name_zh"] ?? '',
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _menus.map((item) {
                return CourseList(
                  id: item["id"].toString(),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
