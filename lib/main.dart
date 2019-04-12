import 'package:flutter/material.dart';
import 'package:my_app/views/firstPage.dart';
import 'package:my_app/views/secondPage.dart';
import 'package:my_app/views/thirdPage.dart';
import 'package:my_app/views/detail.dart';
void main() {
  var id;
  runApp(new MaterialApp(
    title: 'Flutter demo',
    home: MyHomePage(),
    routes:<String,WidgetBuilder>{
      '/detail':(BuildContext context)=>DetailPage(id)
    },
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    controller = new TabController(vsync: this, length: 3);
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: <Widget>[FirstPage(), SecondPage(), ThirdPage()],
      ),
      bottomNavigationBar: Material(
        color: Colors.orangeAccent,
        child: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              text: '首页',
              icon: Icon(Icons.home),
            ),
            Tab(
              text: '通知',
              icon: Icon(Icons.message),
            ),
            Tab(text: '我的', icon: Icon(Icons.cloud))
          ],
        ),
      ),
    );
  }
}
