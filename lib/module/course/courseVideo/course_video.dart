import 'package:flutter/material.dart';

import 'package:custom_chewie/custom_chewie.dart';
import 'package:video_player/video_player.dart';

import 'package:boomenglish/widget/teacher.dart';

import 'package:boomenglish/utilite/ZNRequestManager.dart';
import 'package:boomenglish/utilite/ZNResultModel.dart';
import 'package:boomenglish/model/course.dart';

class CourseVideo extends StatefulWidget {
  CourseVideo({
    this.sceneId,
  });

  final String sceneId;

  @override
  CourseVideoState createState() => new CourseVideoState();
}

class CourseVideoState extends State<CourseVideo>
    with SingleTickerProviderStateMixin {
  VideoPlayerController _videoPlaycontroller;
  TabController _tabController;
  List<String> tabList;

  @override
  void initState() {
    super.initState();
    initTabData();

    _videoPlaycontroller = new VideoPlayerController.network(
      'https://github.com/flutter/assets-for-api-docs/blob/master/assets/videos/butterfly.mp4?raw=true',
    );

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
    _videoPlaycontroller.dispose();
  }

  initTabData() {
    tabList = ['详情', '评价'];
  }

  void _requestData() async {
    print("========+++++++++++++++++++==========");
    print(this.widget.sceneId is String);
    ZNResultModel resultModel = await ZNRequestManager.get(
        "/v1/scenario/scene/${this.widget.sceneId}/video_subtitle/", {});
    var data = resultModel.data['data'];
    print("========+++++++++++++++++++==========");
    print(data);
    // setState(() {

    // });
  }

  @override
  Widget build(BuildContext context) {
    double _statusBarHeight = MediaQuery.of(context).padding.top;
    double width = MediaQuery.of(context).size.width;
    double videoHeight = width * 9.0 / 16.0;
    return Scaffold(
        appBar: null,
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, _statusBarHeight, 0, 0),
              width: width,
              height: videoHeight,
              child: Chewie(
                _videoPlaycontroller,
                aspectRatio: 16.0 / 9.0,
                autoPlay: true,
                looping: true,
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  color: new Color(0xffffffff),
                  height: 44.0,
                  margin: EdgeInsets.fromLTRB(
                      15, _statusBarHeight + videoHeight, 0, 0),
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
                    tabs: tabList.map((item) {
                      return Tab(
                        text: item,
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: tabList.map((item) {
                      if (item == "详情") {
                        return Text(
                          "movie_class",
                        );
                      } else if (item == "评价") {
                        return Text(
                          "online_class",
                        );
                      }
                    }).toList(),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
