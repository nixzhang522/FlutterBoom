import 'package:flutter/material.dart';

typedef void ErrorTap();

class BoomErrorWidget extends StatefulWidget {
  BoomErrorWidget(
      {Key key,
      this.show,
      this.backgroundColor,
      this.message,
      this.child,
      this.errorTap})
      : assert(child != null),
        assert(show != null),
        super(key: key);
  final bool show;
  final Color backgroundColor;
  final String message;
  final ErrorTap errorTap;
  final Widget child;

  @override
  State<StatefulWidget> createState() {
    return _BoomErrorState();
  }
}

class _BoomErrorState extends State<BoomErrorWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(widget.child);
    if (widget.show) {
      Widget errorWidget = GestureDetector(
        onTap: () {
          widget.errorTap();
        },
        child: Container(
          color: widget.backgroundColor != null
              ? widget.backgroundColor
              : Colors.white,
          child: Center(
            child: Text(
              widget.message != null ? widget.message : "点击重试",
              style: TextStyle(fontSize: 16, color: Color(0xFF808080)),
            ),
          ),
        ),
      );
      widgetList.add(errorWidget);
    }
    return new Stack(
      children: widgetList,
    );
  }
}
