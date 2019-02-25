import 'package:flutter/material.dart';

import 'package:chewie/chewie.dart';
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
      'https://cdn-files-prod.boomschool.cn/boom-en-china-prod/scene/1339/video_content_low/OchBWrY-RkebQ1CC8ZLovw==.mp4',
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

  Widget playerWidget() {
    double width = MediaQuery.of(context).size.width;
    double videoHeight = width * 9.0 / 16.0;
    return Chewie(
      controller: ChewieController(
          videoPlayerController: _videoPlaycontroller,
          aspectRatio: 16.0 / 9.0,
          autoPlay: false,
          looping: true,
          materialProgressColors: new ChewieProgressColors(
            playedColor: Colors.red,
            handleColor: Colors.blue,
            backgroundColor: Colors.grey,
            bufferedColor: Colors.lightGreen,
          ),
          placeholder: new Container(
            color: Colors.black,
          ),
          autoInitialize: true,
          customControls: playerControlWidget()),
    );
  }

  Widget playerControlWidget() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 44,
              height: 44,
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Icon(
                IconData(0xe5e0,
                    fontFamily: 'MaterialIcons', matchTextDirection: true),
                color: Colors.white,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  if (_videoPlaycontroller.value.isPlaying) {
                    _videoPlaycontroller.pause();
                  }
                  else {
                    _videoPlaycontroller.play();
                  }
                },
                child: Container(
                  width: 44,
                  height: 44,
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                  child: Icon(
                    IconData(0xe037,
                        fontFamily: 'MaterialIcons', matchTextDirection: true),
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                "00:00/00:00",
                style: TextStyle(color: Colors.white),
              ),
              Expanded(
                flex: 1,
                child: Slider(
                  value: 0.5,
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 44,
                  height: 44,
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                  child: Icon(
                    IconData(0xe5d0,
                        fontFamily: 'MaterialIcons', matchTextDirection: true),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  initTabData() {
    tabList = ['详情', '评价'];
  }

  void _requestData() async {
    // need login
    // ZNResultModel resultModel = await ZNRequestManager.get(
    //     "/v1/scenario/scene/${this.widget.sceneId}/video_subtitle/", {});
    // var data = resultModel.data['data'];
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
                child: playerWidget()),
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
                        return Center(child: Text("详情"));
                      } else if (item == "评价") {
                        return Center(child: Text("评价"));
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
