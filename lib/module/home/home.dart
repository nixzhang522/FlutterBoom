import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  MovieState createState() => new MovieState();
}

class MovieState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primaryColor: Color(0xffffffff)),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("首页"),
        ),
        body: new Center(
          child: new Text('main'),
        ),
      ),
    );
  }
}
