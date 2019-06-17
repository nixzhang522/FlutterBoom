import 'package:flutter/material.dart';
import 'package:boomenglish/widget/course_widget.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:progress_hud/progress_hud.dart';

import 'package:boomenglish/utilite/request_manager.dart';
import 'package:boomenglish/utilite/result_model.dart';
import 'package:boomenglish/model/course.dart';

import 'package:boomenglish/module/course/course_detail/course_detail.dart';

class CourseList extends StatefulWidget {
  CourseList({
    this.id,
  });
  final String id;

  @override
  CourseListState createState() => CourseListState();
}

class CourseListState extends State<CourseList>
    with AutomaticKeepAliveClientMixin {
  var _courses = [];
  var _refreshController = RefreshController();
  var _next;
  ProgressHUD _progressHUD;
  bool _loading = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _requestData();

    _progressHUD = ProgressHUD(
      backgroundColor: Colors.transparent,
      color: Colors.grey,
      containerColor: Colors.transparent,
    );
  }

  Future _requestData() async {
    ResultModel resultModel = await RequestManager.get(
        "/v1/scenario/catalogs/category/${widget.id}/", {});
    var data = resultModel.data['data'];
    List courses = data["scenarios"].map((m) => Course.fromJson(m)).toList();

    setState(() {
      _courses = courses;
      _next = data["pages"]["next"];
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _loading
        ? _progressHUD
        : SmartRefresher(
            enablePullDown: true,
            enablePullUp: _next != null,
            header: WaterDropHeader(),
            controller: _refreshController, // 控制器
            onRefresh: () async {
              await _requestData(); // 等待异步操作
              _refreshController.refreshCompleted(); // 设置状态为完成
            },
            onLoading: () {
              // request more
              _refreshController.loadComplete();
            },
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
            MaterialPageRoute(
                builder: (context) => CourseDetail(
                      scenarioId: scenarioId,
                    )));
      },
    );
  }
}
