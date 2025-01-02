import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int counter = 0;

  int get count => counter;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}
