import 'package:flutter/material.dart';

class TransitionsDemo extends StatefulWidget {
  const TransitionsDemo({super.key});

  @override
  State<TransitionsDemo> createState() => _TransitionsDemoState();
}

class _TransitionsDemoState extends State<TransitionsDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller; //it controls the animation
  late Animation<double> animation; //it defines the animation values

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));

    animation = Tween<double>(begin: 0.0, end: 5.0).animate(controller);

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transitions', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: Column(
        children: [
          SizedBox(height: 100),
          // FadeTransition(
          //     opacity: animation,
          //     child: Text('Fade in Demo', style: TextStyle(fontSize: 30))),
          ScaleTransition(
            scale: animation,
            child: Text('hello Scale!!'),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  isClicked = !isClicked;
                });
              },
              child: Text('Press me'))
        ],
      ),
    );
  }
}
