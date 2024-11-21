import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 99, 135, 58),
        shape: RoundedRectangleBorder(
            // borderRadius: BorderRadius.circular(10.0)
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
        leading: Icon(Icons.backpack, color: Colors.black),
        title: Text('Home Screen'),
        centerTitle: true,
        actions: [Icon(Icons.home)],
      ),
      body: Center(
          child: Text('Hello world',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline))),
    );
  }
}
