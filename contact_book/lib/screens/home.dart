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
  TextEditingController searchQuery = TextEditingController();
  bool isSearchTapped = false;

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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: devWidth * 0.05, vertical: devHeight * 0.01),
            child: TextField(
              onTap: () {
                setState(() {
                  isSearchTapped = true;
                });
              },
              controller: searchQuery,
              decoration: InputDecoration(
                  suffixIcon: searchQuery.text.trim().isEmpty
                      ? IconButton(onPressed: () {}, icon: Icon(Icons.search))
                      : IconButton(
                          onPressed: () {
                            isSearchTapped = false;
                          },
                          icon: Icon(Icons.close)),
                  hintText: 'Search Contact',
                  border: OutlineInputBorder()),
            ),
          ),
          !isSearchTapped
              ? Expanded(
                  child: ListView.builder(
                      itemCount: userList!.length,
                      itemBuilder: (context, index) {
                        UserModel user = UserModel().fromJson(userList![index]);
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: devWidth * 0.02),
                          child: contactCard(
                              name: user.name!,
                              contactNo: user.contactNo!,
                              id: user.id!),
                        );
                      }),
                )
              : Expanded(child: buildSuggestion()),
        ],
      ),
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

  Widget buildSuggestion() {
    // 1 2 3 4 5
    List<Map<String, dynamic>> suggestions = userList!.where((list) {
      List result = list.values.toList();
      bool isMatched = false;
      for (int i = 0; i < result.length; i++) {
        result[i] = result[i].toString().toLowerCase();
        final typedQuery = searchQuery.text.toLowerCase();
        if (result[i].contains(typedQuery)) {
          isMatched = true;
        }
        // print(result[i]);
      }
      return isMatched;
    }).toList();
    return suggestions.isEmpty
        ? Text('No Matching Found')
        : ListView.builder(
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              UserModel user = UserModel().fromJson(suggestions[index]);
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: devWidth * 0.02),
                child: contactCard(
                    name: user.name!, contactNo: user.contactNo!, id: user.id!),
              );
            });
  }

//  Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: devWidth * 0.05, vertical: devHeight * 0.01),
//                 child: TextField(
//                   controller: searchQuery,
//                   decoration: InputDecoration(
//                       suffixIcon: Icon(Icons.search),
//                       hintText: 'Search Contact',
//                       border: OutlineInputBorder()),
//                 ),
//               );
  Widget contactCard(
      {required String name, required String contactNo, required int id}) {
    return Padding(
      padding: EdgeInsets.only(bottom: devHeight * 0.015),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ViewScreen(id: id)));
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
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Edit(id: id)))
                            .then((value) {
                          if (value != null) {
                            readUsersTable();
                            snackBarMessage(msg: 'Updated Successfully !!!');
                          } else {
                            snackBarMessage(
                                msg: 'Error when update the Contact');
                          }
                        });
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
                                      onPressed: () async {
                                        await userService.deleteUser(id: id);
                                        readUsersTable();
                                        Navigator.pop(context);
                                        snackBarMessage(
                                            msg: 'Deleted Successfully');
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
