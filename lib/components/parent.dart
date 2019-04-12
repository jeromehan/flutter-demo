import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_app/common/eventBus.dart';

class Parent extends StatefulWidget {
  @override
  _ParentState createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  var data;
  var data4Two;
  void onDataChange(val) {
    if (!mounted) {
      return;
    }
    setState(() {
      data = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ChildOne(),
          ChildTwo(data4Two: data4Two, callback: (val) => onDataChange(val)),
          Container(
            width: 400.0,
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.only(top: 30.0, bottom: 50.0),
            decoration: BoxDecoration(color: Colors.blue[100]),
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Text('父组件'),
              ),
              Text('子组件2, 传过来的值: ' + '$data'),
            ]),
          )
        ],
      ),
    );
  }
}

class ChildTwo extends StatefulWidget {
  ChildTwo({Key key, this.data4Two, this.callback}) : super(key: key);
  final callback;
  String data4Two;
  @override
  _ChildTwoState createState() => _ChildTwoState();
}

class _ChildTwoState extends State<ChildTwo> {
  String text = '哈哈';
  void firedA() async {
   await widget.callback(text);
  }

  void firedB() {
    eventBus.fire(MyEvent('我是2传给1'));
  }
  @override
  void dispose() {
    super.dispose();
    eventBus.destroy();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new RaisedButton(onPressed: firedB, child: new Text('to兄弟组件')),
        new RaisedButton(onPressed: firedA, child: new Text('to父组件'))
      ],
    );
  }
}

class ChildOne extends StatefulWidget {
  @override
  _ChildOneState createState() => _ChildOneState();
}

class _ChildOneState extends State<ChildOne> {
  var data;
  @override
  void initState() {
    super.initState();
    eventBus.on<MyEvent>().listen((MyEvent data) => show(data.text));
  }
  void show(String val) {
    if (!mounted) {
      return;
    }
    setState(() {
      data = val;
    });
  }
  @override
  void dispose() {
    super.dispose();
    eventBus.destroy();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      decoration: BoxDecoration(color: Colors.blue[100]),
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.only(bottom: 15.0),
              child:  new Text('子组件1'),
            ),
            new Text('子组件2传来的值:$data'),
          ]
        )
      )
    );
  }
}
