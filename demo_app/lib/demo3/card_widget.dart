import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Demo'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50, left: 50),
            child: SizedBox(
              height: 200,
              width: 300,
              child: Card(
                color: Colors.blue.shade300,
                elevation: 12,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text('Hello world',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, left: 50),
            child: SizedBox(
              height: 200,
              width: 300,
              child: Card(
                  color: Colors.blue.shade300,
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Image.asset('images/food3.jpg')),
            ),
          )
        ],
      ),
    );
  }
}
