import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:boomenglish/utilite/request.dart' as request;

class Home extends StatefulWidget {
  @override
  MovieState createState() => new MovieState();
}

class MovieState extends State<Home> {

  var _banners = [];

  @override
  void initState() {
    super.initState();
    print("Home init");
    this._requestData();
  }

  Widget _requestData() {
    request.get("/v1/home/v5/", (response){
    
      print(response);
      
      var data = response['data'];

      setState(() {
        _banners = data["banners"];
      });
      
    }, (error){
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primaryColor: Color(0xffffffff)),
      home: new Scaffold(
        appBar: new AppBar(
          elevation: 0.5,
          title: Text('爆英语'),
          actions: <Widget>[
            IconButton(icon: Image.asset('assets/images/main_mycourse.png', width: 16, height: 18,), onPressed: () {}),
            IconButton(icon: Image.asset('assets/images/main_message.png', width: 18, height: 18,), onPressed: () {}),
          ],
        ),
        body: Container(
          color: Colors.white,
          child: new ListView.builder(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
            itemCount: 10,
            itemBuilder: (context, i) => renderRow(i),
          ),
        )
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.network(
      _banners[index]["list_image"],
      fit: BoxFit.fill,
    ));
  }

  Widget renderRow(i) {
    // banner
    if (i == 0) {
      Size screenSize = MediaQuery.of(context).size;
      double screenWidth = screenSize.width;
      double height = (screenWidth - 30) * 145.0 / 345.0;

      return new Container(
          height: height,
          margin: new EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: new ClipRRect(
            borderRadius: BorderRadius.all(new Radius.circular(6)),
            child: Swiper(
              itemBuilder: _swiperBuilder,
              itemCount: _banners.length,
              pagination: new SwiperPagination(
                  alignment: Alignment.bottomRight,
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white30,
                    activeColor: Colors.white,
                  )),
              scrollDirection: Axis.horizontal,
              autoplay: true,
              autoplayDelay: 5000,
              onTap: (index) => print('点击了第$index个'),
            ),
          ));
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
      double itemWidth = (width - 10 * 2 - 10) / 2.0;
      double itemHeight = itemWidth * 7 / 11.0 + 80;
      double ratio = itemWidth / itemHeight;

      return new Container(
        height: itemHeight * 2 + 40,
        padding: new EdgeInsets.fromLTRB(10, 10, 10, 0),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: itemWidth,
                    height: itemWidth * 7 / 11.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(5),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(
                              "http://pic37.photophoto.cn/20151103/0011034499985505_b.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Text(
                      "爆英语事务所",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff222626),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Text(
                      "观看至第1集",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xff8c8c8c),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(8, 5, 0, 0),
                        padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
                        color: Color(0xfffcd433),
                        height: 16,
                        child: Text(
                          "专业",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xff222626),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 8, 0),
                        child: Text(
                          "免费",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff222626),
                          ),
                        ),
                      ),
                    ],
                  )
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
                            "全年考研VIP全程班-英语",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff222626)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(16, 4, 0, 0),
                          child: Text(
                            "更新至第1集",
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
                            image: NetworkImage(
                                "http://pic37.photophoto.cn/20151103/0011034499985505_b.jpg"),
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
                                  image: NetworkImage(
                                      "http://pic37.photophoto.cn/20151103/0011034499985505_b.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                "Vica",
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
    );
  }
}
