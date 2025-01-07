import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:noti_demo/notifications.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Notification Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Notifications().getBasicNotification();
                },
                child: Text('Basic Notification')),
            ElevatedButton(
                onPressed: () {
                  Notifications().getBigPictureNotification();
                },
                child: Text('BigPicture Notification')),
            ElevatedButton(
                onPressed: () {
                  Notifications().getBigPictureNotification2();
                },
                child: Text('BigPicture Notification 2')),
            ElevatedButton(
                onPressed: () {
                  Notifications().scheduledNotification();
                },
                child: Text('Scheduled Notification 2'))
          ],
        ),
      ),
    );
  }
}
