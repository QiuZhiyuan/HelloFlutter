import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _helloText = 'Say hello to the world';

  String _editableText = 'You can edit this text';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _sayHello() {
    if (_counter % 2 == 0) {
      _helloText = 'Hello World';
    } else {
      _helloText = 'Hello again';
    }
    _counter++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              _helloText,
              textAlign: TextAlign.right,
              style: TextStyle(color: Color(0xFFFF0000), fontSize: 20),
            ),
            EditableText(
              controller: TextEditingController(text: _editableText),
              focusNode: FocusNode(debugLabel: 'this is debug label'),
              style: TextStyle(color: Colors.blue, fontSize: 20),
              cursorColor: Colors.red,
              backgroundCursorColor: Colors.amberAccent,
              showCursor: true,
            ),
          ],
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _sayHello,
        focusColor: Colors.red,
        hoverColor: Colors.blue,
        icon: Column(
          children: <Widget>[Icon(Icons.arrow_drop_up)],
        ),
        label: Text('Say Hello'),
      ),
    );
  }
}
