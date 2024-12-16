import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/auth/email_auth.dart';
import 'package:notes_app/screens/auth_screen.dart';
import 'package:notes_app/screens/create_notes.dart';
import 'package:notes_app/screens/display_notes.dart';

class AuthValidator extends StatefulWidget {
  const AuthValidator({super.key});

  @override
  State<AuthValidator> createState() => _AuthValidatorState();
}

class _AuthValidatorState extends State<AuthValidator> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Authentication().checkinAuthStatus(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //user authentication state = signed in
            User user = snapshot.data!;
            return HomeScreen(user: user);
          } else {
            //user authentication state = signed out
            return AuthScreen();
          }
        });
  }
}
