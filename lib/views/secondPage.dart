import 'package:flutter/material.dart';
import 'package:my_app/components/input.dart';
class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}
class _SecondPageState extends State<SecondPage> {
  TextEditingController controller;
  String active='';
  DateTime _dateTime;
  TimeOfDay _time;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('通知'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              controller: controller,
              onChanged: _onChanged,
            ),
            Input(active:active),
            RaisedButton(
              child: Text('日期控件'),
              onPressed: _showDatePicker,
            ),
            RaisedButton(
              child: Text('时间控件'),
              onPressed: _showTimePicker,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('结果：'+_dateTime.toString()),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('结果：'+_time.toString()),
            )
          ],
        ),
      )
    );
  }
  void _onChanged(String value){
    setState(() {
      active=value;
    });
  }
  void _showDatePicker(){
    _selectDate(context);
  }
  void _showTimePicker(){
    _selectTime(context);
  }
  Future<Null> _selectDate(BuildContext context) async{
    final DateTime _picked =await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: DateTime(2016),
      lastDate: DateTime(2050)
    );
    if(_picked!=null){
      setState(() {
        _dateTime=_picked;
      });
    }
  }
  Future<Null> _selectTime(BuildContext context) async{
    final TimeOfDay _picked =await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now()
    );
    if(_picked!=null){
      setState(() {
        _time=_picked;
      });
    }
  }
}
