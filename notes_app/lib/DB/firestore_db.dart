import 'package:cloud_firestore/cloud_firestore.dart';

class DBFirestore {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static createNotes(
      {required String title,
      required String description,
      required String date,
      required String time,
      required String uid,
      required String color}) {
    try {
      return firestore.collection('Notes/$uid/subCollection').add({
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

  static readNotes({required String uid}) {
    try {
      return firestore.collection('Notes/$uid/subCollection').snapshots();
    } catch (e) {
      print('$e');
    }
  }

  static updateNotes(
      {required String title,
      required String description,
      required String date,
      required String time,
      required String color,
      required String docId,
      required String uid}) {
    try {
      return firestore
          .collection('Notes/$uid/subCollection')
          .doc(docId)
          .update({
        'title': title,
        'description': description,
        'date': date,
        'time': time,
        'color': color
      });
    } catch (e) {
      print('$e');
    }
  }

  static deleteNotes({required String docId, required String uid}) {
    try {
      return firestore
          .collection('Notes/$uid/subCollection')
          .doc(docId)
          .delete();
    } catch (e) {
      print('$e');
    }
  }
}
