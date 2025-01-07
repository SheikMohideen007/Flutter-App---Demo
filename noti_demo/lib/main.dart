import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:noti_demo/home.dart';
import 'package:noti_demo/notification_channels.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // https://www.appicon.co/
  // resource://drawable/res_app_icon
  // .aab -> Android App bundle
  // flutter build apk --release  => build\app\outputs\flutter-apk\app-release.apk
  // flutter build appbundle --release => build\app\outputs\bundle\release\app-release.aab
  // flutter build windows --release build\windows\x64\runner\Release\noti_demo.exe
  // flutter build web --release =>  build\web
  AwesomeNotifications().initialize(
      '',
      [
        NotificationChannels().basicNotificationChannel(),
        NotificationChannels().bigPictureNotificationChannel(),
        NotificationChannels().scheduledNotificationChannel(),
        NotificationChannels().actionNotificationChannel(),
      ],
      debug: true);

  // to getting permission from user to send the notification
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });

  AwesomeNotifications().setListeners(onActionReceivedMethod: (action) async {
    if (action.buttonKeyPressed == "YES") {
      print('user clicked yes');
    } else if (action.buttonKeyPressed == "NO") {
      print('user clicked no');
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: HomeScreen(),
    );
  }
}
