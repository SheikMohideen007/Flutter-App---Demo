import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({super.key});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
      appBar: AppBar(
        title: Text('Buttons Demo'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 150),
        child: Column(
          children: [
            SizedBox(height: 100),
            ElevatedButton(
                onLongPress: () {
                  print('Elevated button is longpressed');
                },
                style: ElevatedButton.styleFrom(
                    // elevation: 50,
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  print('Elevated button is clicked');
                },
                child: Text('click me !!')),
            SizedBox(height: 20),
            TextButton(
                style: TextButton.styleFrom(
                  // backgroundColor: Colors.amberAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () {},
                child: Text('click me !')),
            SizedBox(height: 20),
            OutlinedButton(onPressed: () {}, child: Text('Click me !!')),
            SizedBox(height: 20),
            IconButton(
                onPressed: () {
                  // print('delete alert will be shown');
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Warning !'),
                          content: Text('Are you sure want to delete it ?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Yes')),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('No')),
                          ],
                        );
                      });
                },
                icon: Icon(Icons.delete)),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
