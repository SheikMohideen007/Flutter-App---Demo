import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class SQLDbService {
  // factory DbService() => instance;
  // static final DbService _instance = DbService._internal();

  // DbService._internal();
  Database? _database;

  //setting up the database
  Future<Database> initDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    String currPath = directory.path;
    //data/user/b/0
    var path = join(currPath, 'demo_db');
    //data/user/b/0/demo_db
    return openDatabase(path, version: 1, onCreate: createTable);
  }

  //creating a Table in that demo_db
  Future<void> createTable(Database database, int version) async {
    String sqlQuery =
        "Create table users (id Integer Primary key,name Text,contactNo Text,description Text)";
    await database.execute(sqlQuery);
  }

  //creating a singleton method to make sure Database instance is created only once
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDatabase();
    return _database;
  }

  /* Write operations */

  //create a user or insert a user in table
  Future<int> insertUser(
      {required String table,
      required Map<String, dynamic> tableValues}) async {
    var connection = await database;
    return await connection!.insert(table, tableValues);
  }

  //update a table
  Future<int> updateUser(
      {required String table,
      required Map<String, dynamic> tableValues,
      required int userId}) async {
    var connection = await database;
    return await connection!
        .update(table, tableValues, where: 'id=?', whereArgs: [userId]);
  }

  //delete a user from a table
  Future<int> deleteUser({required String table, required int userId}) async {
    var connection = await database;
    return await connection!.delete(table, where: 'id=?', whereArgs: [userId]);
  }

  /* Read Operations */

  //read all user
  Future<List<Map<String, dynamic>>> readAllUsers(
      {required String table}) async {
    var connection = await database;
    return await connection!.query(table);
  }

  //read particular user by using their user id;
  readUserById({required String table, required int userId}) async {
    var connection = await database;
    return await connection!.query(table, where: 'id=?', whereArgs: [userId]);
  }
}
