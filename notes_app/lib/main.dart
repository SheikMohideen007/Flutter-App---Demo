import 'package:flutter/material.dart';
import 'package:notes_app/screens/create_notes.dart';
import 'package:notes_app/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme()),
      home: HomeScreen(),
      routes: {'create': (context) => CreateNotes()},
    );
  }
}
