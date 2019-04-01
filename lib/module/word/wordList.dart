import 'package:flutter/material.dart';

import 'package:boomenglish/utilite/ZNRequestManager.dart';
import 'package:boomenglish/utilite/ZNResultModel.dart';

class WordList extends StatefulWidget {
  @override
  WordListState createState() => new WordListState();
}

class WordListState extends State<WordList> {
  List _wordDecks = ["", "", "", "", "", ""];
  bool _isInAsyncCall = true;
  bool _error = false;

  Widget _buildItem(item) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Container(
        width: 60,
        height: 150,
        color: Color(0xffffffff),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    this._requestData();
  }

  Future _requestData() async {

    ZNResultModel resultModel = await ZNRequestManager.get("/v1/vocabulary/decks/", {});
    if (resultModel.success) {
      var data = resultModel.data['data'];
      print(data);

      setState(() {

      });
    }
    setState(() {
      _isInAsyncCall = false;
      _error = !resultModel.success;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF222626)),
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0.5,
        title: Text(
          "单词库",
          style: TextStyle(fontSize: 19, color: Color(0xFF222626)),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _buildItem(_wordDecks[index]);
              },
              childCount: 3,
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 3,
            childAspectRatio: 3 / 4.0,
            children: _wordDecks.map((item) {
              return _buildItem(item);
            }).toList(),
          ),
          SliverGrid(
            gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 2.0,
            ),
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _buildItem(_wordDecks[index]);
              },
              childCount: _wordDecks.length,
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 100.0,
            delegate: SliverChildListDelegate(
              _wordDecks.map((item) {
                return _buildItem(item);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
