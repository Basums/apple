//状态管理工具provider

import 'package:flutter/material.dart';

//2
import 'model/AccountModel.dart';
import 'database/AccountHelper.dart';

//3
import 'model/Devicesmodel.dart';
import 'database/DeviceHelper.dart';

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

  updateUser(User updateuser) async {
    await database.saveItem(updateuser); //更新数据库
    userDisplay = updateuser; //更新显示
    notifyListeners(); //监听
  }

  changeUser(User updateuser) {
    userDisplay = updateuser;
    notifyListeners(); //监听
  }

  String registermessage = "注册时必须填3项,而登录只需ID和密码"; //显示信息
  updatamessage(String message) {
    registermessage = message;
    notifyListeners();
  }
}

class ProviderDevices extends ChangeNotifier {
  //新建数据库
  List<Devices> datas = new List(); //存储设备列表
  var database = DevicesHelper(); //设备数据库

  Devices devicesDisplay =
      new Devices(2020, "0", "0", "0", "0", "0"); //外部显示用的设备

  getDevice() async {
    //从数据库获取用户
    List datas = await database.getTotalList();
    if (datas.length == 0) //如果数据库成员为空
    {
      //则添加youke到数据库，作为初始化
      Devices youke = new Devices(2020, "deviceOneId", "deviceTwoId",
          "deviceThreeId", "deviceFourId", "deviceFiveId");
      //添加进数据库
      devicesDisplay = youke;
    } else if (datas.length > 0) //如果数据库存在数据
    {
      devicesDisplay = Devices.fromMap(datas.last);
    }
    notifyListeners();
  }

  savedevices(Devices update) async {
    await database.saveItem(update); //更新数据库
    devicesDisplay = update; //更新显示
    notifyListeners(); //监听
  }

  updateDevicesById(Devices devices) async {
    //根据Id更新
    await database.updateItem(devices);
    //这是用来更新该用户下面的对用设备
    //显示
    devicesDisplay = devices;
    notifyListeners();
  }
}
