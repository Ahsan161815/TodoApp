import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TodoController extends GetxController{
  late final database;
  var queryData = [].obs;

  TodoController(){
    manageDb();
  }

  void manageDb() async {
    await createDB();
    // await insertRecords();
    await queryRecords();
  }

  createDB() async {

    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    // Delete the database
    // await deleteDatabase(path);

    // open the database
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE Todo (id INTEGER PRIMARY KEY, name TEXT, details INTEGER)');
        });


  }

  insertRecords(String name, String details) async {
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Todo(name, details) VALUES("$name", "$details")');
      print('inserted1: $id1');
    });
    await queryRecords();
  }

  insertRecordsById(int id, String name, String details) async {
    await database.transaction((txn) async {
      int id1 = await txn.rawUpdate(
          'Update Todo SET name = ?, details = ? WHERE id= ?',
          [name, details, id]);
      print('inserted1: $id1');
    });
    await queryRecords();
  }

  Future<List<dynamic>> queryRecords() async {
    List<Map> list = await database.rawQuery('SELECT * FROM Todo');
    queryData.value = list;
    // print(list);
    // print(queryData.value);

    return list;
  }



}