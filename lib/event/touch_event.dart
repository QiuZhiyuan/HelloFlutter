import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventWidgets {
  static String sContent = '下面是个待点击的按钮';

  Function callback;

  static int count = 0;

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
      onPressed: _onClick,
      child: Container(
        width: 100,
        height: 30,
        color: Color(0xffff00ff),
        child: Center(
          child: Text('这是单击按钮'),
        ),
      ),
    );
  }

  // InkResponse是Button的基类
  Widget getInkResponse() {
    return InkResponse(
      onDoubleTap: _onDoubleTap,
      onTapDown: _onTapDown,
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

  _onClick() {
    sContent = '已点击按钮';
    callback();
  }

  _onDoubleTap() {
    sContent = '已经被双击';
    callback();
  }

  _onTapDown(TapDownDetails details) {
    log('qiuzhiyuan: dx:' +
        details.globalPosition.dx.toString() +
        " dy" +
        details.globalPosition.dy.toString());
    log('qiuzhiyuan dx:' +
        details.localPosition.dx.toString() +
        ' dy:' +
        details.localPosition.dy.toString());
  }
}
