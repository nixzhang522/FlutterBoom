import 'package:flutter/material.dart';
import 'package:boomenglish/widget/course_widget.dart';

import 'package:boomenglish/utilite/ZNRequestManager.dart';
import 'package:boomenglish/utilite/ZNResultModel.dart';

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
    ZNResultModel resultModel =
        await ZNRequestManager.get("/v1/scenario/catalogs/${this.widget.url}/", {});
    var data = resultModel.data['data'];

    setState(() {
      _courses = data["scenarios"];
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
    var course = _courses[i];
    var pricing = course["pricing"];
    var coursePrice = "免费";
    if (pricing != null) {
      var product = pricing["product"];
      if (product != null) {
        var price = product["price"];
        var salesPrice = product["sales_price"];
        if (salesPrice != null) {
          if (salesPrice > 0) {
            coursePrice = "$salesPrice";
          }
        } else if (price > 0) {
          coursePrice = "$price";
        }
      }
    }

    return CourseWidget(
      courseId: course["id"].toString(),
      courseName: course["name_zh"],
      courseImage: course["list_image"] ?? "",
      courseEpisode: course["episode_cnt"].toString(),
      coursePrice: coursePrice,
      authorAvatar: course["user"]["avatar"],
      authorNickname: course["user"]["nickname"],
      onTap: (scenarioId) {
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new CourseDetail(scenarioId: scenarioId,)));
      },
    );
  }
}
