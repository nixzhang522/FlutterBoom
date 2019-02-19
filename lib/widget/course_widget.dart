import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:boomenglish/model/course.dart';

typedef void CourseOnTap(String courseId);

class CourseWidget extends StatelessWidget {
  CourseWidget({
    this.course,
    this.onTap,
  });

  final Course course;

  final CourseOnTap onTap;

  Widget tagsWidget() {
    List<Widget> tags = [];
    Widget tagsRow;

    int count = course.tags.length > 2 ? 2 : course.tags.length;
    for (var i = 0; i < count; i++) {
      var item = course.tags[i];
      tags.add(Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(1)),
            color: Color(0xfffcd433)),
        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
        padding: EdgeInsets.fromLTRB(8, 1, 8, 1),
        child: Text(
          item.nameZh,
          style: TextStyle(fontSize: 11, color: Color(0xff222626)),
        ),
      ));
    }
    tagsRow = Container(
      margin: EdgeInsets.fromLTRB(15, 8, 15, 0),
      child: Row(children: tags),
    );
    return tagsRow;
  }

  @override
  Widget build(BuildContext context) {
    var pricing = course.pricing;
    var coursePrice = "免费";
    if (pricing != null) {
      var product = pricing.product;
      if (product != null) {
        var price = product.price;
        var salesPrice = product.salesPrice;
        if (salesPrice != null) {
          if (salesPrice > 0) {
            coursePrice = "$salesPrice";
          }
        } else if (price > 0) {
          coursePrice = "$price";
        }
      }
    }

    return GestureDetector(
      onTap: () {
        onTap(course.id.toString());
      },
      child: new Container(
        height: 175.0,
        padding: new EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: new Stack(
          children: <Widget>[
            new Container(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(16, 10, 10, 0),
                              child: Text(
                                course.nameZh,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff222626)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(16, 4, 0, 0),
                              child: Text(
                                "更新至第${course.episodeCnt}集",
                                style: TextStyle(
                                    fontSize: 13, color: Color(0xff808080)),
                              ),
                            ),
                            tagsWidget(),
                          ],
                        ),
                      ),
                      Container(
                        width: 123,
                        height: 94,
                        margin: EdgeInsets.fromLTRB(0, 10, 16, 0),
                        child: ClipRRect(
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: course.listImage ?? "",
                            placeholder: (context, url) =>
                              Image.asset("assets/images/placeholder_course.png"),
                            errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
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
                                    image:
                                        NetworkImage(course.user.avatar ?? ""),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                  course.user.nickname,
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
                            child: coursePrice == "免费"
                                ? Text(
                                    '免费',
                                    style: TextStyle(
                                        color: Color(0xff222626),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )
                                : RichText(
                                    text: TextSpan(
                                        text: "RMB ",
                                        style: TextStyle(
                                            color: Color(0xff222626),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: coursePrice,
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
            )
          ],
        ),
      ),
    );
  }
}
