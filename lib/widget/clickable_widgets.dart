import 'dart:developer';

import 'package:flutter/material.dart';

class ClickableTextView extends Container {
  final ClickCallback onClick;
  final double width;
  final double height;
  final String content;
  final Color backgroundColor;

  ClickableTextView(this.content,
      {this.onClick, this.width, this.height, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: (){
        log('onTap');
      },
//      onDoubleTap: (){
//        log('onDouble tap');
//      },
      onTapDown: onClick,
      child: Container(
        width: width,
        height: height,
        color: backgroundColor,
        child: Center(
          child: Text(content),
        ),
      ),
    );
  }
}

typedef ClickCallback = Function(TapDownDetails details);
