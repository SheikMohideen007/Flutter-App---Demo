import 'package:flutter/material.dart';

class DataScreen extends StatefulWidget {
  final String name;
  final String age;
  final String gender;
  final String profession;
  const DataScreen(
      {super.key,
      required this.name,
      required this.age,
      required this.gender,
      required this.profession});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data showing screen'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Text('Name : ${widget.name}'),
          SizedBox(height: 30),
          Text('Age : ${widget.age}'),
          SizedBox(height: 30),
          Text('Gender : ${widget.gender}'),
          SizedBox(height: 30),
          Text('Profession : ${widget.profession}'),
        ],
      ),
    );
  }
}
