import 'package:flutter/material.dart';

class ListviewbuilderWidget extends StatefulWidget {
  const ListviewbuilderWidget({super.key});

  @override
  State<ListviewbuilderWidget> createState() => _ListviewbuilderWidgetState();
}

class _ListviewbuilderWidgetState extends State<ListviewbuilderWidget> {
  List<String> list = [
    "List 1",
    "Flutter",
    "Dart",
    "Widgets",
    "Compilation",
    "Animation",
    "Course Intro"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listview builder Demo'),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.menu),
                title: Text(list[index]),
                trailing: Icon(Icons.delete),
              );
            }));
  }
}
