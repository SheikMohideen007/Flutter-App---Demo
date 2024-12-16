import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/auth/email_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isRegister = true;
  @override
  Widget build(BuildContext context) {
    double devHeight = MediaQuery.of(context).size.height;
    double devWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: devHeight * 0.3),
            Text(isRegister == true ? 'Sign in' : 'Sign up',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            SizedBox(height: devHeight * 0.05),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Enter your email',
                ),
              ),
            ),
            SizedBox(height: devHeight * 0.02),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Enter your password',
                ),
              ),
            ),
            SizedBox(height: devHeight * 0.05),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white),
                onPressed: () async {
                  User? user;
                  if (email.text.trim() != "" && password.text.trim() != "") {
                    if (email.text.contains('@')) {
                      if (isRegister == true) {
                        user = await Authentication().signIn(
                            email: email.text.trim(),
                            password: password.text.trim());
                      } else {
                        user = await Authentication().signUp(
                            email: email.text.trim(),
                            password: password.text.trim());
                      }
                    } else {
                      final snack = SnackBar(
                        content: Text('Invalid Email'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snack);
                    }

                    if (user != null) {
                      //succesfully signed in
                      final snack = SnackBar(
                        content: Text('Signed in as ${user.email}'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snack);
                    } else {
                      //any problem in sign in
                      final snack = SnackBar(
                          content: Text('Signin Failed'),
                          action: SnackBarAction(
                              label: 'signup',
                              onPressed: () {
                                setState(() {
                                  isRegister = false;
                                });
                              }));
                      ScaffoldMessenger.of(context).showSnackBar(snack);
                    }
                  } else {
                    final snack = SnackBar(
                        content: Text('Email & password cannot be empty'));
                    ScaffoldMessenger.of(context).showSnackBar(snack);
                  }
                },
                child: Text(isRegister == true ? 'Sign in' : 'Sign up',
                    style: TextStyle(fontWeight: FontWeight.bold)))
          ],
        ),
      ),
    );
  }
}
