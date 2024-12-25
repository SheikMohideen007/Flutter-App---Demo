import 'package:flutter/material.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
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
        padding: EdgeInsets.symmetric(horizontal: devWidth * 0.05),
        child: Column(
          children: [
            SizedBox(height: devHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Name :   '), Text('Rajesh')],
            ),
            SizedBox(height: devHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Contact Number :   '), Text('+91234567890')],
            ),
            SizedBox(height: devHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Description :   '), Text('Office Colleague')],
            )
          ],
        ),
      ),
    );
  }
}
