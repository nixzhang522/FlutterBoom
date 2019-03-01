import 'package:flutter/material.dart';
import 'package:boomenglish/widget/course_widget.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:progress_hud/progress_hud.dart';

import 'package:boomenglish/utilite/ZNRequestManager.dart';
import 'package:boomenglish/utilite/ZNResultModel.dart';

import 'package:boomenglish/model/course.dart';

import 'package:boomenglish/module/course/courseDetail/course_detail.dart';

class CourseList extends StatefulWidget {
  CourseList({
    this.url,
  });
  final String url;

  @override
  CourseListState createState() => new CourseListState();
}

class CourseListState extends State<CourseList>
    with AutomaticKeepAliveClientMixin {
  var _courses = [];
  var _refreshController = new RefreshController();
  ProgressHUD _progressHUD;
  bool _loading = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    this._requestData();

    _progressHUD = ProgressHUD(
      backgroundColor: Colors.transparent,
      color: Colors.grey,
      containerColor: Colors.transparent,
    );
  }

  Future _requestData() async {
    ZNResultModel resultModel = await ZNRequestManager.get(
        "/v1/scenario/catalogs/${this.widget.url}/", {});
    var data = resultModel.data['data'];
    List courses =
        data["scenarios"].map((m) => new Course.fromJson(m)).toList();

    setState(() {
      _courses = courses;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? _progressHUD
        : SmartRefresher(
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
              itemCount: _courses.length,
              itemBuilder: (context, i) => renderRow(i),
            ),
          );
  }

  Widget renderRow(i) {
    Course course = _courses[i];
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
}
