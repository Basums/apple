//用来建立本地数据库，存储账户信息和对应的方法
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//导入匹配的成员类
import '../model/AccountModel.dart';

//用户ID,用户名，用户密码,
//UserId,Password,Name
class AccountHelper {

  static final AccountHelper _instance = AccountHelper.internal();
  factory AccountHelper() => _instance;
  final String tableName = "Flutteraccount";
  final String columnUserId = "UserId";
  final String columnPassword = "Password";
  final String columnName = "Name";
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  AccountHelper.internal();

  initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Basumsqflite.db');
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  //创建数据库表
  void _onCreate(Database db, int version) async {
    await db.execute(
        "create table $tableName($columnUserId integer primary key,$columnPassword text,$columnName text)");
  }

  //插入
  Future<int> saveItem(User user) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableName", user.toMap());
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
    return Sqflite.firstIntValue(await dbClient.rawQuery(
        "SELECT COUNT(*) FROM $tableName"
    ));
  }

  //按照id查询
  Future<User> getItem(int userId) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName WHERE id = $userId");
    if (result.length == 0) return null;
    return User.fromMap(result.first);
  }


  //清空数据
  Future<int> clear() async {
    var dbClient = await db;
    return await dbClient.delete(tableName);
  }


  //根据id删除
  Future<int> deleteItem(int id) async {
    var dbClient = await db;
    return await dbClient.delete(tableName,
        where: "$columnUserId = ?", whereArgs: [id]);
  }

  //修改
  Future<int> updateItem(User user) async {
    var dbClient = await db;
    return await dbClient.update("$tableName", user.toMap(),
        where: "$columnUserId = ?", whereArgs: [user.userId]);
  }

  //关闭
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
