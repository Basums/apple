//账户id及设备匹配一个UserID，五个设备Id//如果设备Id为空，则对应的那一项将会被赋值0；
class Devices {
  //用来跟设备进行匹配
  int userId;
  int deviceOneId;
  int deviceTwoId;
  int deviceThreeId;
  int deviceFourId;
  int deviceFiveId;

  //重载构造函数
  Devices(this.userId, this.deviceOneId, this.deviceTwoId, this.deviceThreeId,
      this.deviceFourId, this.deviceFiveId); //分别为一个账户ID下的5个对应设备，其中，

  //类似构造函数体内赋值
  //把User类型转为map类型
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['UserId'] = userId;
    map['deviceOneId'] = deviceOneId;
    map['deviceTwoId'] = deviceTwoId;
    map['deviceThreeId'] = deviceThreeId;
    map['deviceFourId'] = deviceFourId;
    map['deviceFiveId'] = deviceFiveId;
    return map;
  }

  //类似内部构造成员函数
  //把map类型转为Devices成员类型
  static Devices fromMap(Map<String, dynamic> map) {
    Devices device = new Devices(
        map['UserId'],
        map['deviceOneId'],
        map["deviceTwoId"],
        map['deviceThreeId'],
        map['deviceFourId'],
        map["deviceFiveId"]);
    return device;
  }

  //把多个map，转为List列表数组
  static List<Devices> fromMapList(dynamic mapList) {
    List<Devices> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}
