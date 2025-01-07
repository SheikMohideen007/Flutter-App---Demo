import 'package:awesome_notifications/awesome_notifications.dart';

class Notifications {
  void getBasicNotification() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1, //should be unique
            channelKey: 'basic_channel',
            title: 'hello bro',
            body: 'This is a notification demo'));
  }

  void getBigPictureNotification() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 2,
            channelKey: 'big_channel',
            title: 'Check out this image !! guys',
            body:
                'Here is a thumbnail picture for you guys !!!', // network url or asset url
            bigPicture: 'https://dummyjson.com/icon/emilys/128', //600*300
            notificationLayout: NotificationLayout.BigPicture));
  }

  void getBigPictureNotification2() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'big_channel',
            title: 'Check out this image !! guys 2',
            body:
                'Here is a thumbnail picture for you guys !!!', // network url or asset url
            bigPicture: 'https://dummyjson.com/icon/emilys/128', //600*300
            notificationLayout: NotificationLayout.BigPicture));
  }

  void scheduledNotification() async {
    // final String currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'scheduled_channel',
            title: 'Check out this image !! guys from scheduled',
            body:
                'Here is a thumbnail picture for you guys !!!', // network url or asset url
            bigPicture: 'https://dummyjson.com/icon/emilys/128', //600*300
            notificationLayout: NotificationLayout.BigPicture),
        schedule: NotificationCalendar(
            // year: 2025,
            // month: 1,
            // day: 6,
            // hour: 8,
            // minute: 6,
            // second: 0,
            // timeZone: 'Asia/Kolkata'
            // timeZone: 'IST+5.30'
            repeats: true));
  }
}
