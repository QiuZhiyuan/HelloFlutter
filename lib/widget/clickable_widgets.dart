import 'dart:developer';

import 'package:flutter/material.dart';

class ClickableTextView extends StatefulWidget {
  final ClickCallback onClick;
  final double width;
  final double height;
  final String content;
  final Color backgroundColor;

  ClickableTextView(this.content,
      {this.onClick, this.width, this.height, this.backgroundColor});



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ClickableTextViewState(content,
        onClick: onClick,
        width: width,
        height: height,
        backgroundColor: backgroundColor);
  }
}

class _ClickableTextViewState extends State<ClickableTextView> {
  final ClickCallback onClick;
  final double width;
  final double height;
  final String content;
  final Color backgroundColor;

  static int sCount = 0;

  String text = 'Prepare to click: ';

  _ClickableTextViewState(this.content,
      {this.onClick, this.width, this.height, this.backgroundColor});


  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        log('onTap');
        sCount++;
        setState(() {});
      },
      onTapDown: onClick,
      child: Container(
        width: width,
        height: height,
        color: backgroundColor,
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text + sCount.toString()),
              Text(content),
            ],
          ),
        ),
      ),
    );
  }
}

typedef ClickCallback = Function(TapDownDetails details);
