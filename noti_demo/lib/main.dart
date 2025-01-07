import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:noti_demo/home.dart';
import 'package:noti_demo/notification_channels.dart';

void main() {
  // https://www.appicon.co/
  // resource://drawable/res_app_icon
  AwesomeNotifications().initialize(
      '',
      [
        NotificationChannels().basicNotificationChannel(),
        NotificationChannels().bigPictureNotificationChannel(),
        NotificationChannels().scheduledNotificationChannel()
      ],
      debug: true);

  // to getting permission from user to send the notification
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });

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
        useMaterial3: false,
      ),
      home: HomeScreen(),
    );
  }
}
