import 'package:flutter/material.dart';

class Mine extends StatefulWidget {
  @override
  MovieState createState() => MovieState();
}

class MovieState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xffffffff)),
      home: Scaffold(
        appBar: AppBar(
          title: Text("我的"),
          elevation: 0.5,
        ),
        body: Center(
          child: Text('user center'),
        ),
      ),
    );
  }
}