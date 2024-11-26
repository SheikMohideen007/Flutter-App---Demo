import 'package:flutter/material.dart';

class ListTileWidget extends StatefulWidget {
  const ListTileWidget({super.key});

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ListTile Demo'),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
        body: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: ListTile(
                onTap: () => print('Tapped'),
                onLongPress: () => print("Long pressed"),
                tileColor: Colors.blue.shade200,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                title: Text('Title 1'),
                subtitle: Text('Subtitle'),
                leading: Icon(Icons.check_box),
                trailing: Icon(Icons.more_vert),
              ),
            )
          ],
        ),
      ),
    );
  }
}
