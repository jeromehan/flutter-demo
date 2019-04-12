import 'package:flutter/material.dart';
class DetailPage extends StatefulWidget {
  final String id;
  DetailPage(this.id);
  @override
  _DetailPageState createState() => _DetailPageState();
}
class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情页'),
      ),
      body: Container(
        child: Text('详情页id='+widget.id),
      )
    );
  }
}