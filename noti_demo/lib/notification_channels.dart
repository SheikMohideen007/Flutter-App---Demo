import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationChannels {
  NotificationChannel getBasicNotification() {
    return NotificationChannel(
        channelKey: 'basic_channel',
        channelDescription: 'Channel for testing basic notifications',
        channelName: 'Basic Notifications',
        playSound: true,
        enableLights: true,
        importance: NotificationImportance.High
        // ledColor: Colors.white
        );
  }
}
