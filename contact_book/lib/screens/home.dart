import 'package:contact_book/model/user_model.dart';
import 'package:contact_book/screens/create.dart';
import 'package:contact_book/screens/edit.dart';
import 'package:contact_book/screens/view.dart';
import 'package:contact_book/service/user_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>>? userList;
  UserService userService = UserService();
  double devHeight = 0.0, devWidth = 0.0;

  readUsersTable() async {
    userList = [];

    var users = await userService.readAllUsers();
    setState(() {
      users.forEach((user) {
        userList!.add(user);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    readUsersTable();
  }

  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Contact Book'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: ListView.builder(
          itemCount: userList!.length,
          itemBuilder: (context, index) {
            UserModel user = UserModel().fromJson(userList![index]);
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: devWidth * 0.02),
              child: contactCard(
                  name: user.name!, contactNo: user.contactNo!, id: user.id!),
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateContact()))
                .then((value) {
              if (value != null) {
                readUsersTable();
                snackBarMessage(msg: 'Contact Saved !!!');
              } else {
                snackBarMessage(msg: 'Error when save the Contact');
              }
            });
          },
          child: Icon(Icons.add)),
    );
  }

  Widget contactCard(
      {required String name, required String contactNo, required int id}) {
    return Padding(
      padding: EdgeInsets.only(bottom: devHeight * 0.015),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ViewScreen()));
        },
        child: Card(
          elevation: 5,
          child: ListTile(
            title: Text(name),
            subtitle: Text(contactNo),
            trailing: SizedBox(
              width: devWidth * 0.25,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Edit()));
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Colors.green,
                      )),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Delete Contact'),
                                content: Text(
                                    'Are you sure want to delete this contact?'),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Yes')),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('No')),
                                ],
                              );
                            });
                      },
                      icon: Icon(Icons.delete, color: Colors.red)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  snackBarMessage({required String msg}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
