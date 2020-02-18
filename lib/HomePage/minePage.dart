import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../SubPage/AccountInfoPage.dart';
import '../SubPage/Deviceadd.dart';

import '../ProviderBoss.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text("个人中心",
              style: new TextStyle(
                fontSize: 18, //文字大小
                fontFamily: "yahei",
                color: Colors.black87,
              )),
        ),
        preferredSize: Size.fromHeight(50),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Card(
              clipBehavior: Clip.antiAlias,
              semanticContainer: false,
              child: Container(
                color: Colors.white54,
                height: 80,
                alignment: Alignment.center,
                child: ListTile(
                  leading: new Icon(
                    Icons.person_outline,
                    size: 50,
                    color: Colors.deepOrangeAccent,
                  ),
                  title: new Text('账户信息',
                      style: new TextStyle(
                        fontSize: 18, //文字大小
                        fontFamily: "yahei",
                        color: Colors.black,
                      )),
                  trailing: new Icon(
                    Icons.arrow_forward_ios,
                    size: 30,
                    color: Colors.black38,
                  ),
                  onTap: () {
                    print("跳转到账户信息子页面");
                    // AccountPage();
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new AccountPage()));
                  },
                ),
              ),
              //卡片事件监听
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Container(
              child: Text(
                "    服务中心",
                textAlign: TextAlign.center, //文本居中对齐
                style: new TextStyle(
                  fontSize: 17, //文字大小
                  fontFamily: "yahei",
                ),
              ),
              alignment: Alignment.centerLeft, //容器居左对齐
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
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
                        Icons.settings_input_component,
                        size: 30,
                        color: Colors.grey,
                      ),
                      title: new Text('设备绑定',
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
                      onTap: () {
                        print("跳转到设备绑定子页面");
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new DeviceaddPage()));
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
                        Icons.question_answer,
                        size: 30,
                        color: Colors.grey,
                      ),
                      title: new Text('意见反馈',
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
                      onTap: () {
                        showDialog<Null>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return new AlertDialog(
                                title: new Text("意见反馈"),
                                content: new SingleChildScrollView(
                                  child: new ListBody(
                                    children: <Widget>[
                                      new Text("遇到问题，请联系我们我们随时为您解答，项目的QQ群：*********"),
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
                        Icons.filter_drama,
                        size: 30,
                        color: Colors.grey,
                      ),
                      title: new Text('关于我们',
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
                      onTap: () {
                        showDialog<Null>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return new AlertDialog(
                                title: new Text("关于我们"),
                                content: new SingleChildScrollView(
                                  child: new ListBody(
                                    children: <Widget>[
                                      new Text("基于flutter码这么多真的很不容易，您可以加入我们有什么问题欢迎加入我们项目的QQ群：*********"),
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
        ],
      ),
    );
  }
}
