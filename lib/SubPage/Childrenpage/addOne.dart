import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../ProviderBoss.dart';
import '../../model/AccountModel.dart';

import '../../model/Devicesmodel.dart';

class Addone extends StatefulWidget {
  @override
  _AddoneState createState() => _AddoneState();
}

class _AddoneState extends State<Addone> {
  User _userDisplay;
  //开启页面的时候从数据库调用最新的一个数据
  Devices _devicesDisplay;
  //显示该设备下绑定的设备
  int registerdevicesId;
  String registermessage;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProviderAccount providaccount = Provider.of<ProviderAccount>(context);
    ProviderDevices providerDevices = Provider.of<ProviderDevices>(context);
    _userDisplay = providaccount.userDisplay;
    _devicesDisplay = providerDevices.devicesDisplay;

    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.cyan,
          title: Text("绑定设备",
              style: new TextStyle(
                fontSize: 18, //文字大小
                fontFamily: "yahei",
                color: Colors.white,
              )),
          centerTitle: true,
        ),
        preferredSize: Size.fromHeight(50),
      ),
      body: new SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: new Center(
          child: new Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  height: 320,
                  color: Colors.cyan.shade200,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.radio_button_checked,
                              size: 28,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              '当前登录',
                              style: new TextStyle(
                                fontSize: 18, //文字大小
                                fontFamily: "yahei",
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            Icon(
                              Icons.person_outline,
                              size: 28,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              _userDisplay.name,
                              style: new TextStyle(
                                fontSize: 18, //文字大小
                                fontFamily: "yahei",
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 3.0,
                        indent: 0.0,
                        color: Colors.white,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 80,
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              Icons.radio,
                              size: 28,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '设备一',
                              style: new TextStyle(
                                fontSize: 18, //文字大小
                                fontFamily: "yahei",
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 43,
                            ),
                            Icon(
                              Icons.credit_card,
                              size: 28,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              'Id:',
                              style: new TextStyle(
                                fontSize: 18, //文字大小
                                fontFamily: "yahei",
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              _devicesDisplay.deviceOneId.toString(),
                              style: new TextStyle(
                                fontSize: 18, //文字大小
                                fontFamily: "yahei",
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        height: 70,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: TextField(
                                  maxLength:
                                      10, //最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
                                  maxLines: 1, //最大行数
                                  autocorrect: true, //是否自动更正
                                  textAlign: TextAlign.justify, //文本对齐方式
                                  inputFormatters: [
                                    WhitelistingTextInputFormatter.digitsOnly
                                  ], //允许的输入格式
                                  decoration: InputDecoration(
                                    labelText: "DeviceOneId",
                                    fillColor: Colors.white,
                                    prefixIcon: Icon(Icons.account_circle),
                                    filled: true,
                                  ),
                                  onChanged: (context) {
                                    if (context != null) {
                                      registerdevicesId = int.parse(context);
                                    }
                                  },
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 35,
                          width: 150,
                          color: Colors.white,
                          child: RaisedButton(
                            child: Text("绑定/修改"),
                            color: Colors.white,
                            textColor: Colors.black,
                            splashColor: Colors.cyan.shade100,
                            onPressed: () async {
                              //进行数据库数据校验
                              print("进行数据库校验");
                              //设备赋Id
                              print(_userDisplay.userId);
                              print(_devicesDisplay.userId);
                              
                              //设备Id绑定当前用户Id;
                              // _devicesDisplay.userId = _userDisplay.userId;
                              // _devicesDisplay.deviceOneId = registerdevicesId;
                              // providerDevices.getDevicesById(_userDisplay.userId);

                              // _userDisplay.userId

                            },
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
