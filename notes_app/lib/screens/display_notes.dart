import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/DB/firestore_db.dart';
import 'package:notes_app/screens/create_notes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> notesList = [
    // {
    //   'title': 'GYM',
    //   'description': 'Get Shoes when going to gym',
    //   'time': 'Today 9.00',
    //   'color': Colors.blue
    // },
    // {
    //   'title': 'School',
    //   'description': 'Get Shoes when going to gym',
    //   'time': 'Today 9.00',
    //   'color': Colors.greenAccent
    // },
    // {
    //   'title': 'College hshgs',
    //   'description': 'Get Shoes when going to gym',
    //   'time': 'Today 9.00',
    //   'color': Colors.blueAccent
    // },
    // {
    //   'title': 'Office',
    //   'description': 'Get Shoes when going to gym jjsb',
    //   'time': 'Today 9.00',
    //   'color': Colors.orangeAccent
    // },
    // {
    //   'title': 'Home',
    //   'description': 'Get Shoes when going to gym',
    //   'time': 'Today 9.00',
    //   'color': Colors.amberAccent
    // },
    // {
    //   'title': 'GYM',
    //   'description': 'Get Shoes when going to gym jhgsh',
    //   'time': 'Today 9.00',
    //   'color': Colors.blue
    // },
    // {
    //   'title': 'School',
    //   'description': 'Get Shoes ',
    //   'time': 'Today 9.00',
    //   'color': Colors.greenAccent
    // },
    // {
    //   'title': 'College',
    //   'description': 'Get Shoes when going to gym',
    //   'time': 'Today 9.00',
    //   'color': Colors.blueAccent
    // },
    // {
    //   'title': 'Office',
    //   'description': 'Get Shoes when going to gym',
    //   'time': 'Today 9.00',
    //   'color': Colors.orangeAccent
    // },
    // {
    //   'title': 'Home',
    //   'description': 'Get Shoes when going to gym',
    //   'time': 'Today 9.00',
    //   'color': Colors.amberAccent
    // }
  ];
  double devHeight = 0.0, devWidth = 0.0;
  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    // print(devHeight);
    // print(devWidth);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => CreateNotes()));
              Navigator.pushNamed(context, 'create');
            },
            child: Icon(Icons.add)),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: devWidth * 0.03, vertical: devHeight * 0.01),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: devHeight * 0.06,
                    width: devWidth * 0.12,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400, shape: BoxShape.circle),
                    child: Icon(Icons.person),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: devHeight * 0.01, bottom: devHeight * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Notes ...',
                        style: GoogleFonts.abhayaLibre(
                            fontWeight: FontWeight.bold, fontSize: 40)),
                  ],
                ),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: DBFirestore.readNotes(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      int notesLength = snapshot.data!.docs.length;
                      return MasonryGridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 5,
                        itemCount: notesLength,
                        itemBuilder: (context, index) {
                          DocumentSnapshot ds = snapshot.data!.docs[index];
                          Map<String, dynamic> note =
                              ds.data() as Map<String, dynamic>;
                          String colorStr = note['color'];
                          print(colorStr);

                          Color color = Colors.blue;
                          color = getColor(colorStr);
                          print(color);
                          return notesCard(
                              col: color == Colors.white ? Colors.blue : color,
                              title: note['title'],
                              description: note['description'],
                              date: note['date'],
                              time: note['time']);
                        },
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget notesCard(
      {required Color col,
      required String title,
      required String description,
      required String time,
      required String date}) {
    // date = date.substring(2);
    DateTime now = DateTime.now();
    String dt = now.toString().split(' ')[0];
    date = date == dt ? "Today" : date;
    return Card(
      color: col,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: devHeight * 0.02, horizontal: devWidth * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            SizedBox(height: devHeight * 0.01),
            Text(description,
                style: TextStyle(color: Colors.white, fontSize: 14)),
            SizedBox(height: devHeight * 0.02),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade700)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('$date, $time',
                    style: TextStyle(
                      color: Colors.black,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

//to extract the color from colorString
  Color getColor(String colorStr) {
    String hex = colorStr.replaceAll(RegExp(r'[^0-9a-fA-f]'), "");
    print('hex...$hex');
    return Color(int.parse(hex, radix: 16));
  }
}
