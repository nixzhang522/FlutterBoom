import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:boomenglish/widget/teacher.dart';
import 'course_descriptions.dart';
import 'package:boomenglish/widget/course_episode.dart';

import 'package:boomenglish/utilite/ZNRequestManager.dart';
import 'package:boomenglish/utilite/ZNResultModel.dart';
import 'package:boomenglish/model/course.dart';

class CourseDetail extends StatefulWidget {
  CourseDetail({
    this.scenarioId,
  });

  final String scenarioId;

  @override
  CourseDetailState createState() => new CourseDetailState();
}

class CourseDetailState extends State<CourseDetail>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> tabList;
  Course _course;
  List _descriptions = [];
  List _sceneParents = [];

  @override
  void initState() {
    super.initState();
    initTabData();
    _tabController = TabController(
      length: tabList.length,
      vsync: this,
    );

    _requestData();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  initTabData() {
    tabList = ['详情', '课程', '评价'];
  }

  void _requestData() async {
    ZNResultModel resultModel = await ZNRequestManager.get(
        "/v1/scenario/scenario/${this.widget.scenarioId}/", {});
    var data = resultModel.data['data'];
    Course course = Course.fromJson(data["scenario"]);
    var productInfo = data["product_info"];
    var descriptions = productInfo["descriptions"];

    setState(() {
      _course = course;
      _descriptions = descriptions;
      _sceneParents = _course.sceneParents;
    });
  }

  Widget courseInfo() {
    double width = MediaQuery.of(context).size.width;
    double height = width * 9.0 / 16.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            color: Color(0xffe6e6e6),
            width: width,
            height: height,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: _course?.mainImage ?? "https://www.png",
              placeholder: (context, url) => Image.asset(
                  "assets/images/placeholder_course.png",
                  width: width,
                  height: height,
                  fit: BoxFit.cover),
              errorWidget: (context, url, error) => Image.asset(
                    "assets/images/placeholder_course.png",
                    width: width,
                    height: height,
                    fit: BoxFit.cover,
                  ),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(15, 16, 15, 0),
              child: Text(
                _course?.nameZh ?? "",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff222626),
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 15, 0),
              child: Text("免费",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff808080),
                      fontWeight: FontWeight.w700)),
            ),
          ],
        ),
        describe("• 针对人群：${_course?.targetAudience ?? '所有人'}"),
        describe("• 更新至第${_course?.episodeCnt ?? 1}集"),
        describe("• 已有300人参与"),
        tagsWidget(),
        Container(
          height: 110,
          padding: EdgeInsets.fromLTRB(16, 15, 16, 0),
          child: TeacherWidget(
            user: _course?.user,
          ),
        ),
        Container(
          color: new Color(0xffffffff),
          height: 44.0,
          margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: TabBar(
            isScrollable: true,
            controller: _tabController,
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
        )
      ],
    );
  }

  Widget describe(String text) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 4, 15, 0),
      child: Text(
        text,
        style: TextStyle(fontSize: 13, color: Color(0xff808080)),
      ),
    );
  }

  Widget tagsWidget() {
    List<Widget> tags = [];
    Widget tagsRow;
    if (_course != null) {
      int count = _course.tags.length > 2 ? 2 : _course.tags.length;
      for (var i = 0; i < count; i++) {
        var item = _course.tags[i];
        tags.add(Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(1)),
              color: Color(0xfffcd433)),
          margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
          padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
          child: Text(
            item.nameZh,
            style: TextStyle(fontSize: 11, color: Color(0xff222626)),
          ),
        ));
      }
    }
    tagsRow = Container(
      margin: EdgeInsets.fromLTRB(15, 8, 15, 0),
      child: Row(children: tags),
    );
    return tagsRow;
  }

  Widget navWidget() {
    double _statusBarHeight = MediaQuery.of(context).padding.top;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.transparent,
      width: width,
      height: _statusBarHeight + 44,
      child: Row(
        children: <Widget>[
          Container(
            width: 44,
            height: 44,
            margin: EdgeInsets.fromLTRB(5, _statusBarHeight, 0, 0),
            child: GestureDetector(
              child: Icon(
                IconData(0xe5e0,
                    fontFamily: 'MaterialIcons', matchTextDirection: true),
                color: Color(0xffffffff),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: null,
      body: Stack(
        children: <Widget>[
          NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverToBoxAdapter(
                  child: Container(
                    width: width,
                    height: width * 9.0 / 16.0 + 300,
                    child: courseInfo(),
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: tabList.map((item) {
                if (item == "详情") {
                  return CourseDescriptions(
                    width: width,
                    descriptions: _descriptions,
                  );
                } else if (item == "课程") {
                  return EpisodeWidget(
                    sceneParents: _sceneParents,
                    onTap: (sceneId) => {},
                  );
                } else {
                  return Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    color: Colors.white,
                    child: Center(child: Text("暂无评价")),
                  );
                }
              }).toList(),
            ),
          ),
          navWidget(),
        ],
      ),
    );
  }
}
