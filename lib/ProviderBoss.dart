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
  //这是一个小函数，用来检验是否数字字符串
  int isint(String string) {
    try {
      int.parse(string); //如果能通过，则返回1；如果不能返回0
      return 1;
    } catch (e) {
      return 0;
    }
  }

  //这个是servers页面的用来显示设备个数//初始化为0;
  int nowDNum = 0;

  //新建数据库
  List<Devices> datas = new List(); //存储设备列表
  var database = DevicesHelper(); //设备数据库

  Devices devicesDisplay =
      new Devices(2020, "暂无", "暂无", "暂无", "暂无", "暂无"); //外部显示用的设备

  getDevice() async {
    //从数据库获取用户
    List datas = await database.getTotalList();
    if (datas.length == 0) //如果数据库成员为空
    {
      //则添加youke到数据库，作为初始化
      Devices youke = new Devices(2020, "暂无", "暂无", "暂无", "暂无", "暂无");
      //添加进数据库
      devicesDisplay = youke;
    } else if (datas.length > 0) //如果数据库存在数据
    {
      devicesDisplay = Devices.fromMap(datas.last);
    }
    notifyListeners();
  }

  getDeviceById(int userid) async {
    devicesDisplay = await database.getItem(userid);
    addyouxiao();
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

  changenowDNum() {
    //  print(int.parse());
    nowDNum = isint(devicesDisplay.deviceOneId) +
        isint(devicesDisplay.deviceTwoId) +
        isint(devicesDisplay.deviceThreeId) +
        isint(devicesDisplay.deviceFourId) +
        isint(devicesDisplay.deviceFourId);
    notifyListeners(); //监听
  }

  List youxiao = new List(6); //存储有效数据

  addyouxiao() {
    if (devicesDisplay.userId != null) {
      youxiao[0] = devicesDisplay.userId;
    } else {
      youxiao[0] = "2020";
    }
    if (devicesDisplay.userId != 2020) {
      if (isint(devicesDisplay.deviceOneId) == 1) {
        youxiao[1] = int.parse(devicesDisplay.deviceOneId);
      } else {
        youxiao[1] = 0;
      }
      if (isint(devicesDisplay.deviceTwoId) == 1) {
        youxiao[2] = int.parse(devicesDisplay.deviceTwoId);
      } else {
        youxiao[2] = 0;
      }
      if (isint(devicesDisplay.deviceThreeId) == 1) {
        youxiao[3] = int.parse(devicesDisplay.deviceThreeId);
      } else {
        youxiao[3] = 0;
      }
      if (isint(devicesDisplay.deviceFourId) == 1) {
        youxiao[4] = int.parse(devicesDisplay.deviceFourId);
      } else {
        youxiao[4] = 0;
      }
      if (isint(devicesDisplay.deviceFiveId) == 1) {
        youxiao[5] = int.parse(devicesDisplay.deviceFiveId);
      } else {
        youxiao[5] = 0;
      }
    } else {
      print("no");
    }
    notifyListeners();
  }
}
