import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationChannels {
  NotificationChannel basicNotificationChannel() {
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

  NotificationChannel bigPictureNotificationChannel() {
    return NotificationChannel(
        channelKey: 'big_channel',
        channelDescription: 'Channel for testing big picture notifications',
        channelName: 'Big Picture Notifications',
        playSound: true,
        enableLights: true,
        importance: NotificationImportance.High
        // ledColor: Colors.white
        );
  }

  NotificationChannel scheduledNotificationChannel() {
    return NotificationChannel(
        channelKey: 'scheduled_channel',
        channelDescription: 'Channel for testing scheduled notifications',
        channelName: 'Scheduled Notifications',
        playSound: true,
        enableLights: true,
        importance: NotificationImportance.High
        // ledColor: Colors.white
        );
  }
}
