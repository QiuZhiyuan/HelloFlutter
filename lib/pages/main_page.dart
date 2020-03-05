import 'package:HelloFlutter/data/data.dart';
import 'package:HelloFlutter/event/touch_event.dart';
import 'package:flutter/material.dart';

//import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainPage {
  double contentWidth;
  double contentHeight;

  Function callback;

  MainPage(Function callback) {
    this.callback = callback;
  }

  Widget getMainScaffold() {
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Hello,World"),
      ),
      body: getContent(),
    );

    return scaffold;
  }

  Widget getContent() {
    return wrapperByScroller(Column(
      children: <Widget>[
        EventWidgets(callback).getWidget(),
        Text(
          "缩小到五分之一的图片",
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
          ),
        ),
        Image.network(
          imageurl_1,
          scale: 5,
        ),
        Text('输入控件'),
        getInputWidget(),
        Text('这是ListView'),
        getListView(),
        Text('创建一个ListView'),
        createListView(['item1', 'item2', 'item3', 'item4', 'item5', 'item6']),
        Text('下面不知道要加什么了'),
      ],
    ));
  }

  Widget wrapperByScroller(Widget childView) {
    return Container(
      color: Color(0xFFAAAAAA),
      child: ListView(
        children: <Widget>[
          childView,
        ],
      ),
    );
  }

  Widget getInputWidget() {
    // 输入控件InputDecoration需要用定宽的控件包裹
    return Container(
      width: 300,
      child: TextFormField(
        cursorWidth: 1,
        decoration: InputDecoration(
          hintText: 'Enter your content',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget getListView() {
    return Container(
        height: 200,
        child: ListView(
          itemExtent: 40,
          padding: EdgeInsets.only(left: 20, right: 20),
          children: <Widget>[
            getListItem("this is item 0"),
            getListItem("this is item 1"),
            getListItem("this is item 2"),
            getListItem("this is item 3"),
            getListItem("this is item 4"),
            getListItem("this is item 5"),
          ],
        ));
  }

  Widget getListItem(final String content) {
    return Container(
      height: 50,
      width: 100,
      color: Color(0xffffff00),
      child: Center(
        child: Text(content),
      ),
    );
  }

  Widget createListView(List<String> data) {
    return Container(
      height: 200,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Color(0xff00ffff),
            child: Center(
              child: Text(data[index]),
            ),
          );
        },
      ),
    );
  }
}
