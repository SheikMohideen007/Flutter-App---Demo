import 'package:flutter/material.dart';

class ListviewWidget extends StatefulWidget {
  const ListviewWidget({super.key});

  @override
  State<ListviewWidget> createState() => _ListviewWidgetState();
}

class _ListviewWidgetState extends State<ListviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview Demo'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: SizedBox(
        height: 150,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            containerWidget(color: Colors.green),
            containerWidget(color: Colors.blue),
            containerWidget(color: Colors.black26),
            containerWidget(color: Colors.brown),
            containerWidget(color: Colors.cyanAccent),
            containerWidget(color: Colors.indigo),
            containerWidget(color: Colors.deepOrange),
            containerWidget(color: Colors.deepOrange),
          ],
        ),
      ),
    );
  }

  Widget containerWidget({required Color color}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        height: 150,
        width: 150,
        color: color,
      ),
    );
  }
}
