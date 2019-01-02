import 'package:flutter/material.dart';

class Mine extends StatefulWidget {
  @override
  MovieState createState() => new MovieState();
}

class MovieState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primaryColor: Color(0xffffffff)),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("我的"),
        ),
        body: new Center(
          child: new Text('user center'),
        ),
      ),
    );
  }
}