//个人中心账户信息子页面

////用户信息的跳转页面，这是一个数据库文件，用来登录账户和更改账户或者是新建账户。数据库为本地数据库
import 'registerPage.dart';
import 'package:flutter/material.dart';

import '../static/MineO/pix.dart';

//导入模型
import '../model/AccountModel.dart';
import '../model/Devicesmodel.dart';
//导入数据库
//导入provider
import '../ProviderBoss.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  User _userDisplay;
  //开启页面的时候从数据库调用最新的一个数据
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProviderAccount providaccount = Provider.of<ProviderAccount>(context);
    ProviderDevices providerDevices = Provider.of<ProviderDevices>(context);
    _userDisplay = providaccount.userDisplay;

    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.cyan,
          title: Text("账户详情",
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
              height: 185,
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
                          Icons.account_balance,
                          size: 30,
                          color: Colors.lightBlue,
                        ),
                        title: new Text('登录我的账号',
                            style: new TextStyle(
                              fontSize: 18, //文字大小
                              fontFamily: "yahei",
                              color: Colors.black,
                            )),
                        trailing: new Icon(
                          Icons.arrow_right,
                          size: 30,
                          color: Colors.black38,
                        ),
                        onTap: () async {
                          providaccount.updatamessage("请开始您的表演");
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new RegisterPage()));
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
                          Icons.add,
                          size: 30,
                          color: Colors.lightBlue,
                        ),
                        title: new Text('连接账号匹配的设备信息',
                            style: new TextStyle(
                              fontSize: 18, //文字大小
                              fontFamily: "yahei",
                              color: Colors.black,
                            )),
                        onTap: () async {
                          //根据对应Id查询下面匹配的设备信息
                          providerDevices.getDeviceById(_userDisplay.userId);
                          //弹出一个对话框，提示用户更新成功
                          showDialog<Null>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return new AlertDialog(
                                  title: new Text("当前设备"),
                                  content: new SingleChildScrollView(
                                    child: new ListBody(
                                      children: <Widget>[
                                        new Text("设备1_Id：  " +
                                            providerDevices
                                                .devicesDisplay.deviceOneId),
                                        new Text("设备2_Id：  " +
                                            providerDevices
                                                .devicesDisplay.deviceTwoId),
                                        new Text("设备3_Id：  " +
                                            providerDevices
                                                .devicesDisplay.deviceThreeId),
                                        new Text("设备4_Id：  " +
                                            providerDevices
                                                .devicesDisplay.deviceFourId),
                                        new Text("设备5_Id：  " +
                                            providerDevices
                                                .devicesDisplay.deviceFiveId),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    new FlatButton(
                                      child: new Text("Ok"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              });
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
