import 'package:flutter/material.dart';
import 'package:boomenglish/model/course.dart';

typedef void EpisodeContentOnTap(String sceneId);

class EpisodeContentWidget extends StatelessWidget {
  EpisodeContentWidget({
    this.scenes,
    this.onTap,
  });
  final List scenes;
  final EpisodeContentOnTap onTap;

  Widget renderRow(i) {
    Scene scene = scenes[i];
    return GestureDetector(
      onTap: () {
        onTap(scene.id.toString());
      },
      child: Container(
          height: 96.0,
          margin: EdgeInsets.fromLTRB(15, 8, 15, 8),
          padding: EdgeInsets.fromLTRB(0, 0, 27, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(11)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: const Color.fromRGBO(0, 0, 0, 0.1),
                offset: Offset(0.0, 0.0),
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Center(
                child: Container(
                  width: 3,
                  height: 42,
                  color: Color(0xFFFCD433),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(37, 21, 15, 0),
                      child: Text(
                        scene.name ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Color(0xFF222626),
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.none),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(37, 4, 15, 0),
                      child: Text(
                        scene.tagline ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xFF808080),
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/arrow.png',
                  width: 13,
                  height: 14,
                ),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
        child: new ListView.builder(
          padding: EdgeInsets.all(0),
          itemCount: scenes.length,
          itemBuilder: (context, i) => renderRow(i),
        ));
  }
}
