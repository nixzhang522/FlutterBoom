import 'package:flutter/material.dart';

class WordList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF222626)),
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0.5,
        title: Text("单词库", style: TextStyle(fontSize: 19, color: Color(0xFF222626)),),
      ),
      body: Center(
        child: Text("data"),
      ),
    );
  }
}
