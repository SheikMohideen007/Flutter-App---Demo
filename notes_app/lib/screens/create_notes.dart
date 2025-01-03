import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/DB/firestore_db.dart';

class CreateNotes extends StatefulWidget {
  const CreateNotes({super.key});

  @override
  State<CreateNotes> createState() => _CreateNotesState();
}

class _CreateNotesState extends State<CreateNotes> {
  TextEditingController title = TextEditingController(),
      description = TextEditingController();
  double devHeight = 0.0, devWidth = 0.0;
  Color defaultColor = Colors.white;
  List<bool> tickValue = [false, false, false, false, false, false];
  DateTime dt = DateTime.now();
  TimeOfDay tf = TimeOfDay.now();
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: defaultColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String dateStr = dt.toString().split(' ')[0];
          String timeStr = tf.toString().split('(')[1].substring(0, 5);
          if (title.text.trim().isNotEmpty &&
              description.text.trim().isNotEmpty) {
            // print('here..true');
            //saving to DB
            // print('${user!.uid}');
            await DBFirestore.createNotes(
                title: title.text,
                description: description.text,
                uid: user!.uid,
                date: dateStr,
                time: timeStr,
                color: defaultColor.toString());

            Navigator.pop(context);
          } else {
            // print('here..false');
            final snack = SnackBar(
                content: Text('title & description should not be empty'));
            ScaffoldMessenger.of(context).showSnackBar(snack);
          }
        },
        child: Icon(Icons.save),
      ),
      appBar: AppBar(
        backgroundColor: defaultColor,
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
              onPressed: () {
                reminderAlert(context);
              },
              icon: FaIcon(FontAwesomeIcons.bell, size: 25)),
          IconButton(
              onPressed: () {
                colorPalette(context);
              },
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

  Future<dynamic> reminderAlert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('When to remind ?'),
            content: SizedBox(
              height: devHeight * 0.13,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: dt.toString().split(" ")[0],
                    readOnly: true,
                    decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        suffixIcon: IconButton(
                            onPressed: () async {
                              final pickedDate = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2026),
                                  initialDate: DateTime.now());

                              if (pickedDate != null) {
                                setState(() {
                                  dt = pickedDate;
                                  print(dt);
                                });
                              } else {
                                dt = DateTime.now();
                              }

                              Navigator.pop(context);

                              print('picked Date by user is : $pickedDate');
                            },
                            icon: Icon(Icons.calendar_month))),
                  ),
                  SizedBox(height: devHeight * 0.02),
                  TextFormField(
                    initialValue: tf.toString().split("(")[1].split(")")[0],
                    readOnly: true,
                    decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        suffixIcon: IconButton(
                            onPressed: () async {
                              final pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now());

                              if (pickedTime != null) {
                                setState(() {
                                  tf = pickedTime;
                                  print(tf);
                                });
                              } else {
                                tf = TimeOfDay.now();
                              }
                            },
                            icon: Icon(Icons.alarm_add))),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Save'))
            ],
          );
        });
  }

  //to choose a color for a particular note
  Future<dynamic> colorPalette(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setModalState) {
            return SizedBox(
              height: devHeight * 0.2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: devWidth * 0.02),
                child: Row(
                  children: [
                    colorContainer(
                        color: Colors.orangeAccent.shade100,
                        id: 0,
                        onTap: () {
                          setModalState(() {
                            defaultColor = Colors.orangeAccent.shade100;
                            print(defaultColor);
                          });
                        }),
                    colorContainer(
                        color: Colors.blueAccent.shade100,
                        id: 1,
                        onTap: () {
                          setModalState(() {
                            defaultColor = Colors.blueAccent.shade100;
                            print(defaultColor);
                          });
                        }),
                    colorContainer(
                        color: Colors.greenAccent.shade100,
                        id: 2,
                        onTap: () {
                          setModalState(() {
                            defaultColor = Colors.greenAccent.shade100;
                          });
                        }),
                    colorContainer(
                        color: Colors.pinkAccent.shade100,
                        id: 3,
                        onTap: () {
                          setModalState(() {
                            defaultColor = Colors.pinkAccent.shade100;
                          });
                        }),
                    colorContainer(
                        color: Colors.redAccent.shade100,
                        id: 4,
                        onTap: () {
                          setModalState(() {
                            defaultColor = Colors.redAccent.shade100;
                          });
                        }),
                    colorContainer(
                        color: Colors.yellowAccent.shade100,
                        id: 5,
                        onTap: () {
                          setModalState(() {
                            defaultColor = Colors.yellowAccent.shade100;
                          });
                        }),
                  ],
                ),
              ),
            );
          });
        });
  }

  //color palette -> for choosing color
  Widget colorContainer(
      {required Color color,
      required int id,
      required GestureTapCallback onTap}) {
    for (int i = 0; i < tickValue.length; i++) {
      if (i == id) {
        tickValue[i] = true;
      } else {
        tickValue[i] = false;
      }
    }
    return Padding(
      padding: EdgeInsets.only(right: devWidth * 0.01),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              height: devHeight * 0.08,
              width: devWidth * 0.15,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(20)),
            ),
            Visibility(
              visible: false,
              replacement: SizedBox(),
              child: Padding(
                padding: EdgeInsets.only(
                    top: devHeight * 0.02, left: devWidth * 0.01),
                child: Icon(Icons.done, size: 40, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  //texfield for title & description
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
