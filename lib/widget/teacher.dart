import 'package:flutter/material.dart';

class TeacherWidget extends StatefulWidget {
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
                      image: NetworkImage(
                          "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1144163211,2265871402&fm=26&gp=0.jpg"),
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
                        child: Text("MrYang杨老师",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xff222626))),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(13, 0, 10, 0),
                        child: Text(
                          "新概念英语",
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
                        "+关注",
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
                              width: 1))
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Text(
              "我是明明可以靠脸吃饭，偏偏不要脸的杨老师",
              style: TextStyle(fontSize: 12, color: Color(0xff8c8c8c)),
            ),
          )
        ],
      ),
    );
  }
}
