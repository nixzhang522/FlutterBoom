import 'package:flutter/material.dart';

class CourseMain extends StatefulWidget {
  @override
  MovieState createState() => new MovieState();
}

class MovieState extends State<CourseMain> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primaryColor: Color(0xffffffff)),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("课程"),
        ),
        body: new Center(
          child: new Text('course'),
        ),
      ),
    );
  }
}
