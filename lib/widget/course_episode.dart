import 'package:flutter/material.dart';

typedef void EpisodeOnTap(String sceneParentId);

class EpisodeWidget extends StatelessWidget {
  EpisodeWidget({
    this.sceneParents,
    this.onTap,
  });
  final List sceneParents;
  final EpisodeOnTap onTap;

  Widget renderRow(i) {
    return GestureDetector(
      onTap: () {
        onTap("scene id");
      },
      child: new Container(
          height: 90.0,
          padding: new EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Row(
            children: <Widget>[
              Center(
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Color(0xFFFCD433),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "01",
                      style: TextStyle(fontSize: 11, color: Color(0xFF222626)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 23, 15, 0),
                      child: Text(
                        "考研第一课",
                        style:
                            TextStyle(color: Color(0xFF222626), fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 4, 15, 0),
                      child: Text(
                        "视频",
                        style: TextStyle(
                          color: Color(0xFF8C8C8C),
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Color(0xFFE6E6E6))),
                        ),
                        margin: EdgeInsets.fromLTRB(12, 0, 15, 0),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.white,
        child: new ListView.builder(
          padding: EdgeInsets.all(0),
          itemCount: 10,
          itemBuilder: (context, i) => renderRow(i),
        ));
  }
}
