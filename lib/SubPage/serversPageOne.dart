import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ProviderBoss.dart';

class ServersOne extends StatefulWidget {
  @override
  _ServersOneState createState() => _ServersOneState();
}

class _ServersOneState extends State<ServersOne> {
  int _nowNum;

  @override
  Widget build(BuildContext context) {
    ProviderDevices providerDevices = Provider.of<ProviderDevices>(context);

    _nowNum = providerDevices.nowDNum;
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 30.0, bottom: 10.0),
            child: Container(
              child: Text(
                "资源监管",
                textAlign: TextAlign.center, //文本居中对齐
                style: new TextStyle(
                    fontSize: 16, //文字大小
                    fontFamily: "yahei",
                    color: Colors.cyan),
              ),
              alignment: Alignment.centerLeft, //容器居左对齐
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    clipBehavior: Clip.antiAlias,
                    semanticContainer: false,
                    child: Container(
                      color: Colors.deepOrange,
                      width: 150,
                      height: 100,
                      alignment: Alignment.center,
                      child: ListTile(
                        title: new Text('报警',
                            style: new TextStyle(
                              fontSize: 13, //文字大小
                              fontFamily: "yahei",
                              color: Colors.white,
                            )),
                        subtitle: new Text("暂未开发",
                            style: new TextStyle(
                              fontSize: 11, //文字大小
                              fontFamily: "yahei",
                              color: Colors.white,
                            )),
                        trailing: new Icon(
                          Icons.warning,
                          size: 30,
                          color: Colors.white70,
                        ),
                        onTap: () {
                          print("进入报警设置和监听页面");
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    clipBehavior: Clip.antiAlias,
                    semanticContainer: false,
                    child: Container(
                      color: Colors.white,
                      width: 150,
                      height: 100,
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: new Icon(
                          Icons.settings_input_antenna,
                          size: 30,
                          color: Colors.black,
                        ),
                        title: new Text('当前设备个数',
                            style: new TextStyle(
                              fontSize: 13, //文字大小
                              fontFamily: "yahei",
                              color: Colors.black,
                            )),
                        subtitle: new Text(_nowNum.toString(),
                            style: new TextStyle(
                              fontSize: 11, //文字大小
                              fontFamily: "yahei",
                              color: Colors.black,
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
