import 'package:flutter/material.dart';

class ContainerDemo extends StatefulWidget {
  const ContainerDemo({super.key});

  @override
  State<ContainerDemo> createState() => _ContainerDemoState();
}

class _ContainerDemoState extends State<ContainerDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          // rowEnd(),
          // SizedBox(
          //   height: 10,
          // ),
          // rowSpaceAround(),
          // SizedBox(
          //   height: 10,
          // ),
          // rowSpaceBetween(),
          // SizedBox(
          //   height: 10,
          // ),
          // rowSpaceEvenly(),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 500,
            width: 600,
            color: Colors.amberAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                  child: Center(child: Text('Hello')),
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                  child: Center(child: Text('Hello')),
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.orange,
                  child: Center(child: Text('Hello')),
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                  child: Center(child: Text('Hello')),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }

  Row rowSpaceEvenly() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.green,
          child: Center(child: Text('Hello')),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.blue,
          child: Center(child: Text('Hello')),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.orange,
          child: Center(child: Text('Hello')),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.red,
          child: Center(child: Text('Hello')),
        ),
      ],
    );
  }

  Row rowSpaceBetween() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.green,
          child: Center(child: Text('Hello')),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.blue,
          child: Center(child: Text('Hello')),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.orange,
          child: Center(child: Text('Hello')),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.red,
          child: Center(child: Text('Hello')),
        ),
      ],
    );
  }

  Row rowSpaceAround() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.green,
          child: Center(child: Text('Hello')),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.blue,
          child: Center(child: Text('Hello')),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.orange,
          child: Center(child: Text('Hello')),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.red,
          child: Center(child: Text('Hello')),
        ),
      ],
    );
  }

  Row rowEnd() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.green,
          child: Center(child: Text('Hello')),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.blue,
          child: Center(child: Text('Hello')),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.orange,
          child: Center(child: Text('Hello')),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.red,
          child: Center(child: Text('Hello')),
        ),
      ],
    );
  }
}
