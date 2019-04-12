import 'package:flutter/material.dart';
class Input extends StatelessWidget {
  Input({Key key,this.active}):super(key:key);
  String active;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 100.0),
          child: Text('这是一个组件'),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all(width: 1.0,color: Colors.blue)),
          padding: EdgeInsets.all(20.0),
          child: Text(active),
        )
      ],
    );
  }
}