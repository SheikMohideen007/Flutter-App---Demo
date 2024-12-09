import 'package:cloud_firestore/cloud_firestore.dart';

class DBFirestore {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static createNotes(
      {required String title,
      required String description,
      required String date,
      required String time,
      required String color}) {
    try {
      return firestore.collection('Notes').add({
        'title': title,
        'description': description,
        'date': date,
        'time': time,
        'color': color
      });
    } catch (e) {
      print('Problem is $e');
    }
  }

  static readNotes() {
    try {
      return firestore.collection('Notes').snapshots();
    } catch (e) {
      print('$e');
    }
  }

  static updateNotes() {
    try {} catch (e) {
      print('$e');
    }
  }

  static deleteNotes() {
    try {} catch (e) {
      print('$e');
    }
  }
}
