import 'package:flutter/material.dart';
import 'wordList.dart';

class WordMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: '单词',
        theme: new ThemeData(primaryColor: Color(0xffffffff)),
        home: Scaffold(
          appBar: AppBar(
            elevation: 0.5,
            title: Text("单词"),
          ),
          body: Align(
              child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new WordList()));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/images/word_main_add.png",
                    width: 150, height: 150),
                Padding(
                  child: Text(
                    "点击订阅单词库",
                    style: TextStyle(fontSize: 15, color: Color(0xff808080)),
                  ),
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                )
              ],
            ),
          )),
        ));
  }
}
