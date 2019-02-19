import 'package:flutter/material.dart';
import 'package:boomenglish/widget/course_widget.dart';

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

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    this._requestData();
  }

  void _requestData() async {
    ZNResultModel resultModel = await ZNRequestManager.get(
        "/v1/scenario/catalogs/${this.widget.url}/", {});
    var data = resultModel.data['data'];
    List courses =
        data["scenarios"].map((m) => new Course.fromJson(m)).toList();

    setState(() {
      _courses = courses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.white,
        child: new ListView.builder(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
          itemCount: _courses.length,
          itemBuilder: (context, i) => renderRow(i),
        ));
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
