import 'package:contact_book/model/user_model.dart';
import 'package:contact_book/service/user_service.dart';
import 'package:flutter/material.dart';

class ViewScreen extends StatefulWidget {
  final int id;
  const ViewScreen({super.key, required this.id});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  UserService userservice = UserService();
  UserModel user = UserModel();
  // @override
  // void initState() {
  //   super.initState();
  //   readUser();
  // }

  readUser() async {
    print(widget.id);
    var currUser = await userservice.readOnlyOneUser(id: widget.id);

    setState(() {
      user = user.fromJson(currUser[0]);
    });
    return user;
  }

  double devHeight = 0.0, devWidth = 0.0;
  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: FutureBuilder(
          future: readUser(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: devWidth * 0.05),
              child: Column(
                children: [
                  SizedBox(height: devHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Name :   '), Text(user.name!)],
                  ),
                  SizedBox(height: devHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Contact Number :   '),
                      Text(user.contactNo!)
                    ],
                  ),
                  SizedBox(height: devHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Description :   '),
                      Text(user.description!)
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
