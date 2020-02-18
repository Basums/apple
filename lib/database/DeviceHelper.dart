//用来建立本地数据库，存储账户Id及对应的设备
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//导入匹配的成员类
import '../model/Devicesmodel.dart';

class DevicesHelper {
  static final DevicesHelper _instance = DevicesHelper.internal();
  factory DevicesHelper() => _instance;
  final String tableName = "FlutterDevices";
  //一个用户ID表做外键
  //五个设备ID表做绑定
  final String columnUserId = "UserId";
  final String columndeviceOneId = "deviceOneId";
  final String columndeviceTwoId = "deviceTwoId";
  final String columndeviceThreeId = "deviceThreeId";
  final String columndeviceFourId = "deviceFourId";
  final String columndeviceFiveId = "deviceFiveId";
  static Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DevicesHelper.internal();

  initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Langxsqflite.db');
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  //创建数据库表
  void _onCreate(Database db, int version) async {
    await db.execute(
        "create table $tableName($columnUserId integer primary key,$columndeviceOneId integer,$columndeviceTwoId integer,$columndeviceThreeId integer,$columndeviceFourId integer,$columndeviceFiveId integer");
  }

  //插入数据
  Future<int> saveItem(Devices device) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableName", device.toMap());
    return res;
  }

  //查询所有
  Future<List> getTotalList() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName ");
    return result.toList();
  }

  //查询总数
  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableName"));
  }

  //按照id查询
  Future<Devices> getItem(int userId) async {
    var dbClient = await db;
    var result = await dbClient
        .rawQuery("SELECT * FROM $tableName WHERE UserId = $userId");
    if (result.length == 0) return null;
    return Devices.fromMap(result.first);
  }

  //清空数据
  Future<int> clear() async {
    var dbClient = await db;
    return await dbClient.delete(tableName);
  }

  //根据id删除
  Future<int> deleteItem(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableName, where: "$columnUserId = ?", whereArgs: [id]);
  }

  //修改
  Future<int> updateItem(Devices device) async {
    var dbClient = await db;
    return await dbClient.update("$tableName", device.toMap(),
        where: "$columnUserId = ?", whereArgs: [device.userId]);
  }

  //关闭
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
