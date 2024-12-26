import 'package:contact_book/DB/sql_db.dart';
import 'package:contact_book/model/user_model.dart';

class UserService {
  SQLDbService? _sqlDbService;
  UserService() {
    _sqlDbService = SQLDbService();
  }

  /*Users Table - Write Operation*/

  //gets call after creating a user
  Future<int> saveUser(UserModel user) async {
    return await _sqlDbService!
        .insertUser(table: 'users', tableValues: user.toJson());
  }

  //update the user by their id
  Future<int> updateUser(
      {required int id, required Map<String, dynamic> updatedData}) async {
    return await _sqlDbService!
        .updateUser(table: 'users', tableValues: updatedData, userId: id);
  }

//delete the user by their id
  Future<int> deleteUser({required int id}) async {
    return await _sqlDbService!.deleteUser(table: 'users', userId: id);
  }

  /*Users Table - Read Operation*/

  //to read all the users from a 'users' table
  Future<List<Map<String, dynamic>>> readAllUsers() async {
    return await _sqlDbService!.readAllUsers(table: 'users');
  }

//read the particular user by their id
  Future<List<Map<String, dynamic>>> readOnlyOneUser({required int id}) async {
    return await _sqlDbService!.readUserById(table: 'users', userId: id);
  }
}
