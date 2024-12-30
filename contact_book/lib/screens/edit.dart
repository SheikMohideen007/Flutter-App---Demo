import 'package:contact_book/model/user_model.dart';
import 'package:contact_book/service/user_service.dart';
import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  final int id;
  const Edit({super.key, required this.id});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  UserService userService = UserService();
  UserModel user = UserModel();
  TextEditingController name = TextEditingController();
  TextEditingController contactNo = TextEditingController();
  TextEditingController description = TextEditingController();
  bool isNameEmpty = false, isContactEmpty = false, isDescEmpty = false;
  double devHeight = 0.0, devWidth = 0.0;
  late Future<UserModel> result;

  Future<UserModel> readUser() async {
    // print(widget.id);
    var currUser = await userService.readOnlyOneUser(id: widget.id);

    setState(() {
      user = user.fromJson(currUser[0]);
      name.text = user.name!;
      contactNo.text = user.contactNo!;
      description.text = user.description!;
    });
    return user;
  }

  @override
  void initState() {
    super.initState();
    result = readUser();
  }

  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Edit Contact'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: FutureBuilder(
          future: result,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                SizedBox(height: devHeight * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: devWidth * 0.05),
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter the name',
                        errorText:
                            isNameEmpty ? "Name Shouldn't be Empty" : null),
                  ),
                ),
                SizedBox(height: devHeight * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: devWidth * 0.05),
                  child: TextField(
                    controller: contactNo,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter the contact Number',
                        errorText: isContactEmpty
                            ? "Contact Number Shouldn't be Empty"
                            : null),
                  ),
                ),
                SizedBox(height: devHeight * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: devWidth * 0.05),
                  child: TextField(
                    controller: description,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter the description',
                        errorText: isDescEmpty
                            ? "Description Shouldn't be Empty"
                            : null),
                  ),
                ),
                SizedBox(height: devHeight * 0.02),
                ElevatedButton(
                    onPressed: () async {
                      setState(() {});
                      isNameEmpty = name.text.trim().isEmpty ? true : false;
                      isContactEmpty =
                          contactNo.text.trim().isEmpty ? true : false;
                      isDescEmpty =
                          description.text.trim().isEmpty ? true : false;

                      //if all input has some content in it
                      if (!isNameEmpty && !isContactEmpty && !isDescEmpty) {
                        UserService userService = UserService();
                        UserModel user = UserModel();
                        user.name = name.text;
                        user.contactNo = contactNo.text;
                        user.description = description.text;
                        user.id = widget.id;
                        print(user.toJson());
                        print(widget.id);
                        await userService.updateUser(
                            id: widget.id, updatedData: user.toJson());
                        Navigator.pop(context, result);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('All boxes needed to be fill')));
                      }
                    },
                    child: Text('Save Details'))
              ],
            );
          }),
    );
  }
}
