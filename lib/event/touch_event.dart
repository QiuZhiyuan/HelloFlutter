import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventWidgets {
  static String sContent = '下面是个待点击的按钮';

  Function callback;

  EventWidgets(Function callback) {
    this.callback = callback;
  }

  Widget getWidget() {
    return Column(
      children: <Widget>[
        Text(sContent),
        getButtonView(),
        getInkResponse(),
      ],
    );
  }

  Widget getButtonView() {
    return MaterialButton(
      onPressed: onClick,
      child: Container(
        width: 100,
        height: 30,
        color: Color(0xffff00ff),
      ),
    );
  }

  // InkResponse是Button的基类
  Widget getInkResponse() {
    return InkResponse(
      onDoubleTap: onDoubleTap,
      child: Container(
        width: 100,
        height: 30,
        color: Color(0xffffff00),
        child: Center(
          child: Text('这个是双击按钮'),
        ),
      ),
    );
  }

  onClick() {
    sContent = '已点击按钮';
    callback();
  }

  onDoubleTap() {
    sContent = '已经被双击';
    callback();
  }
}
