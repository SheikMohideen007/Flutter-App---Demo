import 'package:contact_book/screens/create.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double devHeight = 0.0, devWidth = 0.0;
  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: devWidth * 0.02),
        child: Column(
          children: [
            SizedBox(height: devHeight * 0.02),
            contactCard(name: 'Sheik', contactNo: '1234567890'),
            contactCard(name: 'ShFluttereik', contactNo: '1234567890'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateContact()));
          },
          child: Icon(Icons.add)),
    );
  }

  Widget contactCard({required String name, required String contactNo}) {
    return Padding(
      padding: EdgeInsets.only(bottom: devHeight * 0.015),
      child: Card(
        elevation: 5,
        child: ListTile(
          title: Text(name),
          subtitle: Text(contactNo),
          trailing: SizedBox(
            width: devWidth * 0.25,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      color: Colors.green,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete, color: Colors.red)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
