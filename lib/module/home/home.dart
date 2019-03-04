import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:boomenglish/widget/error.dart';
import 'package:boomenglish/widget/course_widget.dart';

import 'package:boomenglish/utilite/ZNRequestManager.dart';
import 'package:boomenglish/utilite/ZNResultModel.dart';

import 'package:boomenglish/model/home_banner.dart';
import 'package:boomenglish/model/course.dart';

import 'package:boomenglish/module/course/courseDetail/course_detail.dart';
import 'package:boomenglish/module/login/login.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  List _banners = [];
  List _hotCourses = [];
  List _recommendCourses = [];
  var _module = [
    {"icon": "assets/images/main_video.png", "title": "新闻资讯"},
    {"icon": "assets/images/main_audio.png", "title": "音频资讯"},
    {"icon": "assets/images/main_story.png", "title": "故事对白"},
    {"icon": "assets/images/main_dub.png", "title": "最新配音"},
  ];
  var _refreshController = new RefreshController();
  bool _isInAsyncCall = true;
  bool _error = false;

  @override
  void initState() {
    super.initState();
    this._requestData();
  }

  Future _requestData() async {
    setState(() {
      _error = false;
    });

    ZNResultModel resultModel = await ZNRequestManager.get("/v1/home/v5/", {});
    if (resultModel.success) {
      var data = resultModel.data['data'];

      List banners =
          data["banners"].map((m) => new HomeBanner.fromJson(m)).toList();
      List hotCourses =
          data["hot_scenarios"].map((m) => new Course.fromJson(m)).toList();
      List recommendCourses = data["recommended_scenarios"]
          .map((m) => new Course.fromJson(m))
          .toList();

      setState(() {
        _banners = banners;
        _hotCourses = hotCourses;
        _recommendCourses = recommendCourses;
      });
    }
    setState(() {
      _isInAsyncCall = false;
      _error = !resultModel.success;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primaryColor: Color(0xffffffff)),
      home: new Scaffold(
        appBar: new AppBar(
          elevation: 0.5,
          title: Text('爆英语'),
          actions: <Widget>[
            IconButton(
                icon: Image.asset(
                  'assets/images/main_mycourse.png',
                  width: 16,
                  height: 18,
                ),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new Login()));
                }),
            IconButton(
                icon: Image.asset(
                  'assets/images/main_message.png',
                  width: 18,
                  height: 18,
                ),
                onPressed: () {}),
          ],
        ),
        backgroundColor: Colors.white,
        body: BoomErrorWidget(
          show: _error,
          errorTap: (){
            setState(() {
              _isInAsyncCall = true;
            });
            _requestData();
          },
          child: ModalProgressHUD(
            child: SmartRefresher(
              enablePullDown: true,
              onRefresh: (bool up) async {
                await _requestData(); // 等待异步操作
                _refreshController.sendBack(
                    true, RefreshStatus.completed); // 设置状态为完成
              },
              onOffsetChange: (bool up, double offset) {},
              headerBuilder: (context, mode) {
                return new ClassicIndicator(
                  mode: mode,
                  height: 45.0,
                  releaseText: '松开手刷新',
                  refreshingText: '刷新中',
                  completeText: '刷新完成',
                  failedText: '刷新失败',
                  idleText: '下拉刷新',
                );
              },
              controller: _refreshController, // 控制器
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                itemCount: 6 + _recommendCourses.length,
                itemBuilder: (context, i) => renderRow(i),
              ),
            ),
            inAsyncCall: _isInAsyncCall,
            opacity: 0,
            progressIndicator: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  Widget renderRow(i) {
    // banner
    if (i == 0) {
      return _bannerBuilder();
    }
    // draw
    if (i == 1) {
      return _drawBuilder();
    }
    // module
    if (i == 2) {
      Size screenSize = MediaQuery.of(context).size;
      double width = screenSize.width;
      double itemWidth = (width - 15 * 2 - 10) / 2.0;
      double ratio = itemWidth / 60;

      return new Container(
        height: 130,
        margin: new EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: new GridView.builder(
          physics: new NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(0),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: itemWidth,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: ratio,
          ),
          itemCount: _module.length,
          itemBuilder: (context, i) {
            return new Container(
              decoration: BoxDecoration(
                color: Color(0xfffbfbfb),
                borderRadius: BorderRadius.all(new Radius.circular(3)),
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset(_module[i]["icon"], width: 27, height: 27),
                  new Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(_module[i]["title"]),
                  ),
                ],
              ),
            );
          },
        ),
      );
    }
    // hot course title
    if (i == 3) {
      return _courseCategoryBuilder('热门课程', '大家喜欢的课程在这里', false);
    }
    // hot course
    if (i == 4) {
      Size screenSize = MediaQuery.of(context).size;
      double width = screenSize.width;
      double itemWidth = (width - 10 * 2 - 10) / 2.0;
      double itemHeight = itemWidth * 7 / 11.0 + 80;
      double ratio = itemWidth / itemHeight;
      return new Container(
        height: itemHeight * 2 + 40,
        padding: new EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: new GridView.builder(
          physics: new NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(0),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: itemWidth,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: ratio,
          ),
          itemCount: _hotCourses.length,
          itemBuilder: _hotCourseBuilder,
        ),
      );
    }
    // recommend course title
    if (i == 5) {
      return _courseCategoryBuilder('推荐课程', '为你量身定做的课程在这里', true);
    }
    // recommend course
    Course course = _recommendCourses[i - 6];
    return CourseWidget(
      course: course,
      onTap: (scenarioId) {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new CourseDetail(
                      scenarioId: scenarioId,
                    )));
      },
    );
  }

  Widget _bannerBuilder() {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double height = (screenWidth - 30) * 145.0 / 345.0;
    return new Container(
        height: height,
        margin: new EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: new ClipRRect(
          borderRadius: BorderRadius.all(new Radius.circular(6)),
          child: Swiper(
            itemBuilder: _swiperBuilder,
            itemCount: _banners.length,
            pagination: new SwiperPagination(
                alignment: Alignment.bottomRight,
                builder: DotSwiperPaginationBuilder(
                  color: Colors.white30,
                  activeColor: Colors.white,
                )),
            scrollDirection: Axis.horizontal,
            autoplay: true,
            autoplayDelay: 5000,
            onTap: (index) => print('点击了第$index个'),
          ),
        ));
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    HomeBanner homeBanner = _banners[index];
    return (Image.network(
      homeBanner.listImage,
      fit: BoxFit.fill,
    ));
  }

  Widget _drawBuilder() {
    return new Container(
      height: 52,
      margin: new EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: new Row(
        children: <Widget>[
          new Container(
            child: new Image.asset(
              'assets/images/main_draw.png',
              width: 30,
              height: 30,
            ),
            margin: new EdgeInsets.fromLTRB(16, 0, 10, 0),
          ),
          new Text('打卡赢抽奖',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
        ],
      ),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(new Radius.circular(6)),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.1),
            offset: new Offset(0.0, 0.0),
            blurRadius: 5.0,
          ),
        ],
      ),
    );
  }

  Widget _courseCategoryBuilder(String name, String tagline, bool more) {
    return new Container(
      height: 50,
      margin: new EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                name ?? "",
                style: new TextStyle(
                    fontSize: 18,
                    height: 1.2,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff222626)),
              ),
              new Text(tagline ?? "",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff808080),
                  ))
            ],
          ),
          more
              ? new Image.asset(
                  "assets/images/arrow.png",
                  width: 14,
                  height: 14,
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _hotCourseBuilder(BuildContext context, int index) {
    Size screenSize = MediaQuery.of(this.context).size;
    double width = screenSize.width;
    double itemWidth = (width - 10 * 2 - 10) / 2.0;
    Course course = _hotCourses[index];
    return GestureDetector(
      onTap: () {
        Navigator.push(
            this.context,
            new MaterialPageRoute(
                builder: (context) => new CourseDetail(
                      scenarioId: course.id.toString(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.all(new Radius.circular(6)),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: const Color.fromRGBO(0, 0, 0, 0.1),
              offset: new Offset(0.0, 0.0),
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: itemWidth,
              height: itemWidth * 7 / 11.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(5),
                ),
                image: DecorationImage(
                    image: NetworkImage(course.listImage), fit: BoxFit.cover),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Text(
                course.nameZh,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff222626),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Text(
                "更新至第${course.episodeCnt}集",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 11,
                  color: Color(0xff8c8c8c),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(8, 5, 0, 0),
                  padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
                  color: Color(0xfffcd433),
                  height: 16,
                  child: Text(
                    "专业",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xff222626),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 8, 0),
                  child: Text(
                    "免费",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff222626),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
