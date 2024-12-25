import 'package:flutter/material.dart';

class CreateContact extends StatefulWidget {
  const CreateContact({super.key});

  @override
  State<CreateContact> createState() => _CreateContactState();
}

class _CreateContactState extends State<CreateContact> {
  TextEditingController name = TextEditingController();
  TextEditingController contactNo = TextEditingController();
  TextEditingController description = TextEditingController();
  bool isNameEmpty = false, isContactEmpty = false, isDescEmpty = false;
  double devHeight = 0.0, devWidth = 0.0;
  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Create Contact'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: Column(
        children: [
          SizedBox(height: devHeight * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: devWidth * 0.05),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the name',
                  errorText: isNameEmpty ? "Name Shouldn't be Empty" : null),
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
                  errorText:
                      isDescEmpty ? "Description Shouldn't be Empty" : null),
            ),
          ),
          SizedBox(height: devHeight * 0.02),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  isNameEmpty = name.text.trim().isEmpty ? true : false;
                  isContactEmpty = contactNo.text.trim().isEmpty ? true : false;
                  isDescEmpty = description.text.trim().isEmpty ? true : false;
                });
              },
              child: Text('Save Details'))
        ],
      ),
    );
  }
}
