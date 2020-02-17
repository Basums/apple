//状态管理工具provider

import 'package:flutter/material.dart';

import 'model/AccountModel.dart';
import 'database/AccountHelper.dart';

class ProviderBoss extends ChangeNotifier {
  int curNum = 0;
  add() {
    curNum += 1;
    notifyListeners(); //校验
  }

  minus() {
    curNum -= 1;
    notifyListeners();
  }
}

class ProviderAccount extends ChangeNotifier {
  //新建数据库
  List<User> datas = new List(); //存储用户的数据列表
  var database = AccountHelper(); //数据库

  User userDisplay = new User(2020, "Youke", "Youke"); //外部显示用的User;

  getUser() async {
    //从数据库获取用户
    List datas = await database.getTotalList();
    if (datas.length == 0) //如果数据库成员为空
    {
      //则添加youke到数据库，作为初始化
      User youke = new User(2020, "Youke", "Youke");
      //添加进数据库
      userDisplay = youke;
    } else if (datas.length > 0) //如果数据库存在数据
    {
      userDisplay = User.fromMap(datas.last);
    }
    notifyListeners();
  }

  updateUser(User updateuser) {
    database.saveItem(updateuser);//更新数据库
    userDisplay = updateuser;//更新显示
    notifyListeners();//监听
  }
}
