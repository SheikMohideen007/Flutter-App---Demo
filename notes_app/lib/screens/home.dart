import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    // print(devHeight);
    // print(devWidth);
    return SafeArea(
      child: Scaffold(
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
              Wrap(
                children: [
                  Card(
                    color: Colors.blue,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: devHeight * 0.02,
                          horizontal: devWidth * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Coffee',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          SizedBox(height: devHeight * 0.01),
                          Text('Prepare hot coffee for friends',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          SizedBox(height: devHeight * 0.02),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey.shade700)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Today, 6.30',
                                  style: TextStyle(
                                    color: Colors.black,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
