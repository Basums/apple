//个人中心账户信息子页面
////用户信息的跳转页面，这是一个数据库文件，用来登录账户和更改账户或者是新建账户。数据库为本地数据库
import 'dart:async';
import 'registerPage.dart';
import 'package:flutter/material.dart';

import '../static/MineO/pix.dart';

//导入模型
import '../model/AccountModel.dart';
//导入数据库
import '../database/AccountHelper.dart';
//导入provider
import '../ProviderBoss.dart';
import 'package:provider/provider.dart';

import '../SubPage/Childrenpage/addOne.dart';
import '../SubPage/Childrenpage/addTwo.dart';
import '../SubPage/Childrenpage/addThree.dart';
import '../SubPage/Childrenpage/addFour.dart';
import '../SubPage/Childrenpage/addFive.dart';

class DeviceaddPage extends StatefulWidget {
  @override
  _DeviceaddPageState createState() => _DeviceaddPageState();
}

class _DeviceaddPageState extends State<DeviceaddPage> {
  User _userDisplay;
  //开启页面的时候从数据库调用最新的一个数据
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProviderAccount providaccount = Provider.of<ProviderAccount>(context);
    _userDisplay = providaccount.userDisplay;

    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.cyan,
          title: Text("设备绑定",
              style: new TextStyle(
                fontSize: 18, //文字大小
                fontFamily: "yahei",
                color: Colors.white,
              )),
          centerTitle: true,
        ),
        preferredSize: Size.fromHeight(50),
      ),
      body: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                alignment: Alignment.topCenter,
                color: Color(0xffffffff),
                height: 135,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 160,
                      height: 120,
                      child: Card(
                        elevation: 20.0,
                        //设置shape，这里设置成了R角
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
                        clipBehavior: Clip.antiAlias,
                        semanticContainer: true,
                        child: Column(
                          children: <Widget>[
                            Image.asset(Account_Image[0],
                                height: 100, fit: BoxFit.cover)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      width: 190,
                      height: 100,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 28.0,
                          ),
                          Text(
                            _userDisplay.name,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "UserId:    " + _userDisplay.userId.toString(),
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              alignment: Alignment.topCenter,
              height: 320,
              child: Column(
                children: <Widget>[
                  Card(
                    clipBehavior: Clip.antiAlias,
                    semanticContainer: false,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0))),
                    child: Container(
                      color: Colors.white12,
                      height: 55,
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: new Icon(
                          Icons.devices_other,
                          size: 30,
                          color: Colors.lightBlue,
                        ),
                        title: new Text('设备一',
                            style: new TextStyle(
                              fontSize: 18, //文字大小
                              fontFamily: "yahei",
                              color: Colors.black,
                            )),
                        //  trailing: new Icon(
                        //    Icons.arrow_right,
                        //    size: 30,
                        //    color: Colors.black38,
                        //  ),
                        onTap: () async {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new Addone()));
                        },
                      ),
                    ),
                    //卡片事件监听
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    semanticContainer: false,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0))),
                    child: Container(
                      color: Colors.white12,
                      height: 55,
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: new Icon(
                          Icons.devices_other,
                          size: 30,
                          color: Colors.lightBlue,
                        ),
                        title: new Text('设备二',
                            style: new TextStyle(
                              fontSize: 18, //文字大小
                              fontFamily: "yahei",
                              color: Colors.black,
                            )),
                        //  trailing: new Icon(
                        //    Icons.arrow_right,
                        //    size: 30,
                        //    color: Colors.black38,
                        //  ),
                        onTap: () async {
                          // print("设备二");
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new Addtwo()));
                        },
                      ),
                    ),
                    //卡片事件监听
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    semanticContainer: false,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0))),
                    child: Container(
                      color: Colors.white12,
                      height: 55,
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: new Icon(
                          Icons.devices_other,
                          size: 30,
                          color: Colors.lightBlue,
                        ),
                        title: new Text('设备三',
                            style: new TextStyle(
                              fontSize: 18, //文字大小
                              fontFamily: "yahei",
                              color: Colors.black,
                            )),
                        //  trailing: new Icon(
                        //    Icons.arrow_right,
                        //    size: 30,
                        //    color: Colors.black38,
                        //  ),
                        onTap: () async {
                          // print("设备三");
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new Addthree()));
                        },
                      ),
                    ),
                    //卡片事件监听
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    semanticContainer: false,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0))),
                    child: Container(
                      color: Colors.white12,
                      height: 55,
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: new Icon(
                          Icons.devices_other,
                          size: 30,
                          color: Colors.lightBlue,
                        ),
                        title: new Text('设备四',
                            style: new TextStyle(
                              fontSize: 18, //文字大小
                              fontFamily: "yahei",
                              color: Colors.black,
                            )),
                        //  trailing: new Icon(
                        //    Icons.arrow_right,
                        //    size: 30,
                        //    color: Colors.black38,
                        //  ),
                        onTap: () async {
                          // print("设备四");
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new Addfour()));
                        },
                      ),
                    ),
                    //卡片事件监听
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    semanticContainer: false,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0))),
                    child: Container(
                      color: Colors.white12,
                      height: 55,
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: new Icon(
                          Icons.devices_other,
                          size: 30,
                          color: Colors.lightBlue,
                        ),
                        title: new Text('设备五',
                            style: new TextStyle(
                              fontSize: 18, //文字大小
                              fontFamily: "yahei",
                              color: Colors.black,
                            )),
                        //  trailing: new Icon(
                        //    Icons.arrow_right,
                        //    size: 30,
                        //    color: Colors.black38,
                        //  ),
                        onTap: () async {
                          // print("设备五");
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new Addfive()));
                        },
                      ),
                    ),
                    //卡片事件监听
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
