import 'dart:convert';

import 'package:apple/database/DeviceHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import '../ProviderBoss.dart';
import '../model/AccountModel.dart';
import '../model/Devicesmodel.dart';

import '../database/AccountHelper.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  User _userDisplay;
  Devices _devicesDisplay;
  //开启页面的时候从数据库调用最新的一个数据
  var datab = AccountHelper(); //数据库

  var datac = DevicesHelper(); //创建第二个数据库

  int registerUserId;
  String registerPassword;
  String registerName;

  String registermessage;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProviderAccount providaccount = Provider.of<ProviderAccount>(context);

    //用于设备更新
    ProviderDevices providerDevices = Provider.of<ProviderDevices>(context);

    _userDisplay = providaccount.userDisplay;
    registermessage = providaccount.registermessage;

    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.cyan,
          title: Text("修改登录",
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
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  height: 450,
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
                      SizedBox(
                        height: 25,
                      ),
                      Divider(
                        height: 3.0,
                        indent: 0.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 250,
                        width: 330,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
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
                                    labelText: "UserId",
                                    fillColor: Colors.white,
                                    prefixIcon: Icon(Icons.account_circle),
                                    filled: true,
                                  ),
                                  onChanged: (context) {
                                    if (context != null) {
                                      registerUserId = int.parse(context);
                                    }
                                  },
                                )),
                            Expanded(
                                flex: 1,
                                child: TextField(
                                  maxLength:
                                      10, //最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
                                  maxLines: 1, //最大行数
                                  autocorrect: true, //是否自动更正
                                  textAlign: TextAlign.justify, //文本对齐方式
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    fillColor: Colors.white,
                                    prefixIcon: Icon(Icons.panorama_horizontal),
                                    filled: true,
                                  ),
                                  onChanged: (context) {
                                    registerPassword = context;
                                  },
                                )),
                            Expanded(
                                flex: 1,
                                child: TextField(
                                  maxLength:
                                      10, //最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
                                  maxLines: 1, //最大行数
                                  autocorrect: true, //是否自动更正
                                  textAlign: TextAlign.justify, //文本对齐方式
                                  decoration: InputDecoration(
                                    labelText: "Name",
                                    fillColor: Colors.white,
                                    prefixIcon: Icon(Icons.alternate_email),
                                    filled: true,
                                  ),
                                  onChanged: (context) {
                                    registerName = context;
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
                            child: Text("登录/注册"),
                            color: Colors.white,
                            textColor: Colors.black,
                            splashColor: Colors.cyan.shade100,
                            onPressed: () async {
                              //进行数据库数据校验
                              if ((registerUserId != null) &&
                                  (registerPassword != "")) {
                                print(registerUserId);
                                print(registerName);
                                print(registerPassword);
                                //首先按照ID查询数据库是否有该条数据的UserId//登录时可以不输入Name,注册则一定要有,没有不给通过
                                //查询条目
                                User search =
                                    await datab.getItem(registerUserId);

                                Devices search2 =
                                    await datac.getItem(registerUserId);

                                if (search == null) //如果结果为空,则需要判断是否有姓名
                                {
                                  if ((registerName == "") ||
                                      (registerName == null)) {
                                    providaccount.updatamessage(
                                        "注册模式,姓名为空,或登陆模式,账号密码错误");
                                  } else {
                                    // 账号不为空,则是注册模式.加入数据库,注册成功
                                    _userDisplay = User(registerUserId,
                                        registerPassword, registerName); //重载
                                    providaccount.updateUser(_userDisplay); //更新

                                    //在注册的时候我觉的可以直接更新Devices的设备进去
                                    //注册的时候是不存在用户的，也不存在用户对应的5个数据
                                    //所有应该清零或者初始化
                                    _devicesDisplay = Devices(
                                        registerUserId,
                                        "deviceOneId",
                                        "deviceTwoId",
                                        "deviceThreeId",
                                        "deviceFourId",
                                        "deviceFiveId");
                                    providerDevices
                                        .savedevices(_devicesDisplay); //保存
                                    // 添加成功
                                    providaccount.updatamessage("注册模式,添加成功");
                                  }
                                } else {
                                  //搜索结果不为空，即检索到了，可以登录
                                  if (registerPassword !=
                                      search.password) //如果密码不匹配
                                  {
                                    providaccount.updatamessage(
                                        "检索UserId成功，登录模式,但密码不正确");
                                  } else {
                                    providaccount.changeUser(search);
                                    providaccount.updatamessage("登录成功");
                                    //登录成功的时候，也应该更新一下；
                                    providerDevices.devicesDisplay = search2;
                                    // providerDevices.getDevicesById(registerUserId);
                                  }
                                }
                              } else {
                                providaccount.updatamessage("账号或者密码不完整，请检查后重试");
                              }
                            },
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 30.0,
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        clipBehavior: Clip.antiAlias,
                        semanticContainer: false,
                        child: Container(
                          color: Colors.cyan.shade200,
                          height: 185,
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 55,
                              ),
                              Text("注册/登录信息",
                                  style: new TextStyle(
                                    fontSize: 18, //文字大小
                                    fontFamily: "yahei",
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                height: 15,
                              ),
                              Text(registermessage,
                                  style: new TextStyle(
                                    fontSize: 16, //文字大小
                                    fontFamily: "yahei",
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
