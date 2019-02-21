import 'package:flutter/material.dart';
import 'package:boomenglish/model/course.dart';

class TeacherWidget extends StatefulWidget {
  TeacherWidget({this.user});
  final User user;

  @override
  TeacherState createState() => new TeacherState();
}

class TeacherState extends State<TeacherWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff6f7f9),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 14, 14, 0),
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: SizedBox(
                    width: 37.0,
                    height: 37.0,
                    child: Image(
                      image: NetworkImage(widget.user?.avatar ?? ""),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(13, 1, 10, 0),
                        child: Text(widget.user?.nickname ?? "",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xff222626))),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(13, 0, 10, 0),
                        child: Text(
                          widget.user?.signature ?? "",
                          style:
                              TextStyle(fontSize: 11, color: Color(0xff808080)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 60,
                  height: 26.0,
                  child: RaisedButton(
                      padding: EdgeInsets.all(0),
                      child: new Text(
                        widget.user?.isFollowing == true ? "已关注" : "+关注",
                        style:
                            TextStyle(color: Color(0xff222626), fontSize: 11),
                      ),
                      color: Color(0xfff6f7f9),
                      textColor: Color(0xff222626),
                      elevation: 0,
                      onPressed: () {
                        print("attention");
                      },
                      disabledColor: Colors.grey,
                      disabledElevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          side: BorderSide(
                              color: Color(0xFF222626),
                              style: BorderStyle.solid,
                              width: 1))),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Text(
              widget.user?.signature ?? "",
              style: TextStyle(fontSize: 12, color: Color(0xff8c8c8c)),
            ),
          )
        ],
      ),
    );
  }
}
