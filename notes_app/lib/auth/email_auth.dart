import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  FirebaseAuth auth = FirebaseAuth.instance;

  signIn({required String email, required String password}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print('$e');
    }
  }

  signUp({required String email, required String password}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print('$e');
    }
  }

  signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print('$e');
    }
  }

  Stream<User?> checkinAuthStatus() {
    return auth.authStateChanges();
  }
}
