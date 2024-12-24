import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DbService {
  static final DbService _instance = DbService._internal();
  // factory DbService() => instance;
  DbService._internal();

  //setting up the database
  Future<Database> initDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    String currPath = directory.path;
    //data/user/b/0
    // var path = join(currPath, 'demo_db');
    //data/user/b/0/demo_db
    return openDatabase("", onCreate: createTable);
  }

  //creating a Table in that demo_db
  Future<void> createTable(Database database, int version) async {
    String sqlQuery =
        "Create table users (id Integer Primary key,name Text,contactNo Text,description Text)";
    await database.execute(sqlQuery);
  }

  //create a user

  //read all user

  //read particular user;

  //update a table

  //delete a user from a table
}
