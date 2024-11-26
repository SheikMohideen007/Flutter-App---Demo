import 'package:flutter/material.dart';

class RichtextWidget extends StatefulWidget {
  const RichtextWidget({super.key});

  @override
  State<RichtextWidget> createState() => _RichtextWidgetState();
}

class _RichtextWidgetState extends State<RichtextWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('RichText Demo'),
            centerTitle: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          body: Center(
              child: RichText(
                  text: TextSpan(
                      text: 'Hello',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 33,
                          fontWeight: FontWeight.bold),
                      children: [
                TextSpan(text: ' World', style: TextStyle(color: Colors.red)),
                TextSpan(
                    text: ' India',
                    style: TextStyle(color: Colors.blue, fontSize: 20)),
              ])))),
    );
  }
}
