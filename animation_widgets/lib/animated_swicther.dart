import 'package:flutter/material.dart';

class SwitcherDemo extends StatefulWidget {
  const SwitcherDemo({super.key});

  @override
  State<SwitcherDemo> createState() => _SwitcherDemoState();
}

class _SwitcherDemoState extends State<SwitcherDemo> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated switcher', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: Column(
        children: [
          SizedBox(height: 100),
          AnimatedSwitcher(
            duration: Duration(seconds: 2),
            child: !isClicked ? Text('hello Flutter !!') : Icon(Icons.done),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  isClicked = !isClicked;
                });
              },
              child: Text('Press me'))
        ],
      ),
    );
  }
}
