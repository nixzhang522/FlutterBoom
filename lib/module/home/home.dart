import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  MovieState createState() => new MovieState();
}

class MovieState extends State<Home> {
  @override
  void initState() {
    super.initState();
    print("Home init");
  }

  @override
  Widget build(BuildContext context) {
    Widget listView = new ListView.builder(
      padding: EdgeInsets.fromLTRB(0, 88, 0, 15),
      itemCount: 10,
      itemBuilder: (context, i) => renderRow(i),
    );
    return new Stack(
      children: <Widget>[
        listView,
        new Container(
          color: Colors.green,
          height: 88,
        ),
      ],
    );
  }

  Widget renderRow(i) {
    // banner
    if (i == 0) {
      return new Container(
        height: 150.0,
        margin: new EdgeInsets.fromLTRB(15, 15, 15, 0),
        decoration: new BoxDecoration(
          color: Colors.green,
          borderRadius: new BorderRadius.all(new Radius.circular(6)),
        ),
        child: new Container(),
      );
    }
    // draw
    if (i == 1) {
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
          itemCount: 4,
          itemBuilder: (context, i) {
            return new Container(
              decoration: BoxDecoration(
                color: Color(0xfffbfbfb),
                borderRadius: BorderRadius.all(new Radius.circular(3)),
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset('assets/images/main_video.png',
                      width: 27, height: 27),
                  new Container(
                    width: 10,
                    height: 10,
                  ),
                  new Text('视频资讯')
                ],
              ),
            );
          },
        ),
      );
    }
    // hot course title
    if (i == 3) {
      return new Container(
        height: 50,
        margin: new EdgeInsets.fromLTRB(15, 25, 15, 0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              '热门课程',
              style: new TextStyle(
                  fontSize: 18,
                  height: 1.2,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff222626)),
            ),
            new Text('大家喜欢的课程在这里',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff808080),
                ))
          ],
        ),
      );
    }
    // hot course
    if (i == 4) {
      Size screenSize = MediaQuery.of(context).size;
      double width = screenSize.width;
      double itemWidth = (width - 15 * 2 - 10) / 2.0;
      double itemHeight = itemWidth * 7 / 11.0 + 80;
      double ratio = itemWidth / itemHeight;
      print(itemWidth);

      return new Container(
        height: itemHeight * 2 + 40,
        padding: new EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: new GridView.builder(
          physics: new NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(0),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: ratio,
          ),
          itemCount: 4,
          itemBuilder: (context, i) {
            return new Container(
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
            );
          },
        ),
      );
    }
    // recommend course title
    if (i == 5) {
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
                  '推荐课程', 
                  style: new TextStyle(
                      fontSize: 18,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff222626)),
                ),
                new Text('为你量身定做的课程在这里',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808080),
                    ))
              ],
            ),
            new Image.asset(
              "assets/images/arrow.png",
              width: 14,
              height: 14,
            )
          ],
        ),
      );
    }
    // recommend course
    return new Container(
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
          )
        ],
      ),
    );
  }


}
