import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String climate, time, degree;
  const RoundedImage(
      {super.key,
      required this.devHeight,
      required this.climate,
      required this.time,
      required this.degree});

  final double devHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          radius: devHeight * 0.035,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset('images/$climate.png'),
          ),
        ),
        SizedBox(height: 10),
        Text(time,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Colors.grey.shade600)),
        Text('$degree°',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ],
    );
  }
}
