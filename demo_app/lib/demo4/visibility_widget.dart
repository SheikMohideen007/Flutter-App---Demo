import 'package:flutter/material.dart';

class VisibilityWidget extends StatefulWidget {
  const VisibilityWidget({super.key});

  @override
  State<VisibilityWidget> createState() => _VisibilityWidgetState();
}

class _VisibilityWidgetState extends State<VisibilityWidget> {
  bool isFree = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Visibility Demo'),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 150),
          child: Column(
            children: [
              SizedBox(height: 100),
              Visibility(
                  visible: isFree,
                  replacement:
                      Text('Premium Plan', style: TextStyle(fontSize: 20)),
                  child: Text('Free Plan', style: TextStyle(fontSize: 20))),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isFree = !isFree;
                    });
                  },
                  child: Text(isFree == true ? 'Subscribe' : 'unSubscribe'))
            ],
          ),
        ),
      ),
    );
  }
}
