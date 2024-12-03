import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateNotes extends StatefulWidget {
  const CreateNotes({super.key});

  @override
  State<CreateNotes> createState() => _CreateNotesState();
}

class _CreateNotesState extends State<CreateNotes> {
  TextEditingController title = TextEditingController(),
      description = TextEditingController();
  double devHeight = 0.0, devWidth = 0.0;
  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, size: 25)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.mapPin, size: 25)),
          IconButton(
              onPressed: () {}, icon: FaIcon(FontAwesomeIcons.bell, size: 25)),
          IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.palette, size: 25)),
        ],
      ),
      body: Column(
        children: [
          tfield(
              controller: title, isTitle: true, hintText: 'Enter a title ..'),
          SizedBox(height: devHeight * 0.02),
          tfield(
              controller: description,
              isTitle: false,
              hintText: 'Enter a description ..'),
        ],
      ),
    );
  }

  Widget tfield(
      {required TextEditingController controller,
      required bool isTitle,
      required String hintText}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: devWidth * 0.03),
      child: TextField(
        maxLines: isTitle ? 1 : 2,
        controller: controller,
        style: TextStyle(
            fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
            fontSize: 18),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
                fontWeight: isTitle ? FontWeight.bold : FontWeight.normal)),
      ),
    );
  }
}
