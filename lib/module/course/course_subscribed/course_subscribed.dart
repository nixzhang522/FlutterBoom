import 'package:flutter/material.dart';
import 'package:boomenglish/widget/course_widget.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:boomenglish/utilite/request_manager.dart';
import 'package:boomenglish/utilite/result_model.dart';
import 'package:boomenglish/model/course.dart';

import 'package:boomenglish/widget/error.dart';
import 'package:boomenglish/module/course/course_detail/course_detail.dart';

class CourseSubscribedList extends StatefulWidget {
  @override
  CourseSubscribedListState createState() => CourseSubscribedListState();
}

class CourseSubscribedListState extends State<CourseSubscribedList>
    with AutomaticKeepAliveClientMixin {
  var _courses = [];
  var _refreshController = RefreshController();
  var _lastkey;
  bool _error = false;
  bool _isInAsyncCall = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _requestData();
  }

  Future _requestData() async {
    ResultModel resultModel =
        await RequestManager.get("/v1/scenario/catalog_subscribed/", {});

    if (resultModel.success) {
      var data = resultModel.data['data'];
      var scenarios = data["scenarios"] ?? [];
      List courses = scenarios.map((m) => Course.fromJson(m)).toList();
      setState(() {
        _courses = courses;
        _lastkey = data["lastkey"];
      });
    }

    setState(() {
      _isInAsyncCall = false;
      _error = !resultModel.success;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xFF222626)),
          backgroundColor: Color(0xFFFFFFFF),
          elevation: 0.5,
          title: Text(
            "我的课程",
            style: TextStyle(fontSize: 19, color: Color(0xFF222626)),
          ),
        ),
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          child: BoomErrorWidget(
            show: _error,
            errorTap: () {
              setState(() {
                _isInAsyncCall = true;
              });
              _requestData();
            },
            child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: _lastkey != null,
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
            ),
          ),
          inAsyncCall: _isInAsyncCall,
          opacity: 0,
          progressIndicator: CircularProgressIndicator(),
        ));
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
