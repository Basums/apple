import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// import 'package:apple/SubPage/serversPageOne.dart';
// import 'package:apple/SubPage/serversPagetwo.dart';

class DevicePage extends StatefulWidget {
  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage>
    with SingleTickerProviderStateMixin {
  List _tabs = ["设备总览", "设备控制台"];
  TabController _controller; //声明controller

  // bool updateCondition = true;

  // // 你可以在初始化的时候调用这个函数 直jie timedUpdate()
  //  Future<void> timedUpdate() async {
  //   while (updateCondition) {
  //     await Future.delayed(Duration(seconds: 10));
  //     //const response  = await Dio().get();
  //   }
  // }

  @override
  void initState() {
    super.initState();
    this._controller = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text("我的设备",
              style: new TextStyle(
                fontSize: 18, //文字大小
                fontFamily: "yahei",
                color: Colors.black87,
              )),
        ),
        preferredSize: Size.fromHeight(50),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                //          color: Colors.blue,
                child: TabBar(
              indicatorColor: Color(0xff00C5CD),
              labelColor: Color(0xff00C5CD), //选中Label
              unselectedLabelColor: Colors.black54, //未选中Label
              controller: _controller,
              tabs: _tabs.map((t) => Tab(text: t)).toList(),
            )),
            // Container(
            //   height: 500,
            //   child: TabBarView(
            //     controller: _controller,
            //     children: <Widget>[ServersOne(), ServersTwo()],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
//      Column(
//
//    );
//  }
//}
