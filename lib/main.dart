import 'package:flutter/material.dart';
import 'HomePage/serversPage.dart';
import 'HomePage/messagePage.dart';
import 'HomePage/minePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = "Flutter Code Sample";


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStateWidget(),
    );
  }
}

class MyStateWidget extends StatefulWidget{
  @override
  _MyStateWidget createState() => _MyStateWidget();
}

class _MyStateWidget extends State<MyStateWidget> {
  int currentIndex = 0;//页面初始化
  //引入页面列表
  List<StatefulWidget> pageList = [
    DevicePage(),
    MessagePage(),
    MinePage()
  ];
  //声明key
  GlobalKey<ScaffoldState> _globalKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_globalKey,
      body: this.pageList[this.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.devices_other), title: Text("我的设备")),
            BottomNavigationBarItem(icon: Icon(Icons.message), title: Text("消息中心")),
            BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("个人中心")),
          ],
          currentIndex: this.currentIndex,
          onTap: (index){
            setState(() {
              this.currentIndex = index;
            });
          },
      ),
    );
  }

}