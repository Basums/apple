//账户密码用户Id模型。
class User{
  //定义成员函数
  //
  // UserId => 账户的唯一识别码
  // Password => 账户的登录密码
  // Name => 账户Id匹配的用户名，唯一匹配，暂时不做修改
  int userId;
  String password;
  String name;

  //构造函数
  User(this.userId, this.password, this.name);

  //类似构造函数体内赋值
  //把User类型转为map类型
  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map['UserId'] = userId;
    map['Password'] = password;
    map['Name'] = name;
    return map;
  }

  //类似内部构造成员函数
  //把map类型转为User成员类型
  static User fromMap(Map<String, dynamic> map){
    User user = new User(map['UserId'],map['Password'],map["Name"]);
    return user;
  }

  //把多个map，转为List列表数组
  static List<User> fromMapList(dynamic mapList) {
    List<User> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}