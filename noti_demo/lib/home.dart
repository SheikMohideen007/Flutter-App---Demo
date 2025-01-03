import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

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
                  AwesomeNotifications().createNotification(
                      content: NotificationContent(
                          id: 1, //should be unique
                          channelKey: 'basic_channel',
                          title: 'hello bro',
                          body: 'This is a notification demo'));
                },
                child: Text('Get Notification'))
          ],
        ),
      ),
    );
  }
}
