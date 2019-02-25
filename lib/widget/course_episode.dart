import 'package:flutter/material.dart';
import 'package:boomenglish/model/course.dart';

typedef void EpisodeOnTap(String sceneParentId, List scenes);

class EpisodeWidget extends StatefulWidget {
  EpisodeWidget({
    this.sceneParents,
    this.onTap,
  });
  final List sceneParents;
  final EpisodeOnTap onTap;

  @override
  EpisodeWidgetState createState() => new EpisodeWidgetState();
}

class EpisodeWidgetState extends State<EpisodeWidget> {
  List _sceneList = [];

  Widget renderRow(i) {
    SceneParent sceneParent = _sceneList[i];

    return GestureDetector(
      onTap: () {
        widget.onTap(sceneParent.id.toString(), sceneParent.mainAndMinorScenes);
      },
      child: Container(
          height: 90.0,
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          color: Colors.white,
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
                      sceneParent.sortorder.toString() ?? "01",
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
                        sceneParent.nameZh ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(color: Color(0xFF222626), fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 4, 15, 0),
                      child: Text(
                        sceneParent.tagline ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
    List tempArray = [];
    for (SceneParentClass category in widget.sceneParents) {
      tempArray.addAll(category.sceneParents);
    }
    _sceneList = tempArray;

    return new Container(
        color: Colors.white,
        child: new ListView.builder(
          padding: EdgeInsets.all(0),
          itemCount: _sceneList.length,
          itemBuilder: (context, i) => renderRow(i),
        ));
  }
}
