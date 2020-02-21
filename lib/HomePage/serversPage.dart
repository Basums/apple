import 'package:apple/ProviderBoss.dart';
import 'package:apple/model/Devicesmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:apple/SubPage/serversPageOne.dart';
import 'package:apple/SubPage/serversPagetwo.dart';
import 'package:provider/provider.dart';

class DevicePage extends StatefulWidget {
  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage>
    with SingleTickerProviderStateMixin {
  List _tabs = ["设备总览", "设备控制台"];
  TabController _controller; //声明controller

  Devices devicesdisplay = Devices(2020, "0", "0", "0", "0", "0");

  var devid_num = 0;

  List devid_list = new List(6);


  bool updateCondition = true;
  //你可以在初始化的时候调用这个函数 直jie timedUpdate()
  Future<void> timedUpdate(int devId) async {
    while (updateCondition) {
      await Future.delayed(Duration(seconds: 10));
      Dio dio = Dio();
      dio.options.sendTimeout = 3000;
      dio.options.receiveTimeout = 2000;
      RequestOptions requestOptions = new RequestOptions(
          headers: {"api-key": "jZm80ZvQPVkgXOpBnP0IsCYAMCs="});
      Response response = await dio.get(
          "http://api.heclouds.com/devices/datapoints",
          queryParameters: {"devIds": devId},
          options: requestOptions);
      print(response);
      print(devId);
    }
  }

  @override
  void initState() {
    super.initState();
    this._controller = TabController(length: _tabs.length, vsync: this);
    // timedUpdate();
    timedUpdate(devid_list[1]);
  }

  @override
  Widget build(BuildContext context) {
    ProviderDevices providerDevices = Provider.of<ProviderDevices>(context);
    devicesdisplay = providerDevices.devicesDisplay;

    devid_list[0] = providerDevices.youxiao[0];
    devid_list[1] = providerDevices.youxiao[1];
    devid_list[2] = providerDevices.youxiao[2];
    devid_list[3] = providerDevices.youxiao[3];
    devid_list[4] = providerDevices.youxiao[4];
    devid_list[5] = providerDevices.youxiao[5];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text(
              "我的设备" +
                  devid_list[0].toString() +
                  devid_list[1].toString() +
                  devid_list[2].toString() +
                  devid_list[3].toString() +
                  devid_list[4].toString() +
                  devid_list[5].toString(),
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
            Container(
              height: 620,
              child: TabBarView(
                controller: _controller,
                children: <Widget>[ServersOne(), ServersTwo()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
