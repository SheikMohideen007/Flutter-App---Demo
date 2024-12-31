import 'package:animation_widgets/animated_opacity.dart';
import 'package:animation_widgets/animated_swicther.dart';
import 'package:animation_widgets/transitions.dart';
import 'package:flutter/material.dart';

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
      ),
      home: TransitionsDemo(),
    );
  }
}
//  0 (Invisible) - 1 (Visible)
// 0.1,0.2,0.3,0.5