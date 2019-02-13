import 'package:flutter/material.dart';

typedef void CourseOnTap(String courseId);

class CourseWidget extends StatelessWidget {

  CourseWidget({
    this.courseId,
    this.courseName,
    this.courseImage,
    this.courseEpisode,
    this.authorAvatar,
    this.authorNickname,
    this.coursePrice,
    this.onTap,
  });
  
  final String courseId;
  final String courseName;
  final String courseImage;
  final String courseEpisode;
  final String authorAvatar;
  final String authorNickname;
  final String coursePrice;

  final CourseOnTap onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(courseId);  
      },
      child: new Container(
        height: 175.0,
        padding: new EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: new Stack(
          children: <Widget>[
            new Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(16, 10, 0, 0),
                            child: Text(
                              courseName,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff222626)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(16, 4, 0, 0),
                            child: Text(
                              "更新至第${courseEpisode}集",
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xff808080)),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(16, 4, 0, 0),
                                height: 18,
                                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                color: Color(0xfffcd433),
                                child: Text(
                                  "外教",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 11, color: Color(0xff222626)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(16, 4, 0, 0),
                                height: 18,
                                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                color: Color(0xfffcd433),
                                child: Text(
                                  "精品",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 11, color: Color(0xff222626)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 123,
                        height: 94,
                        margin: EdgeInsets.fromLTRB(0, 10, 16, 0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          image: DecorationImage(
                              image: NetworkImage(courseImage),
                              fit: BoxFit.cover),
                        ),
                      )
                    ],
                  ),
                  Container(
                    color: Color(0xfff8f8f8),
                    height: 42,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: Row(
                            children: <Widget>[
                              ClipOval(
                                child: SizedBox(
                                  width: 32.0,
                                  height: 32.0,
                                  child: Image(
                                    image: NetworkImage(authorAvatar),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                  authorNickname,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff222626)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                            child: RichText(
                              text: TextSpan(
                                  text: "RMB ",
                                  style: TextStyle(
                                      color: Color(0xff222626),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "1600",
                                        style: TextStyle(
                                            color: Color(0xff222626),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700))
                                  ]),
                            ))
                      ],
                    ),
                  )
                ],
              ),
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
            )
          ],
        ),
      ),
    );
  }
}
