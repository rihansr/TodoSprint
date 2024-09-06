import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
import '../configs/app_config.dart';

final notificationService = NotificationService.value;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class NotificationService {
  static NotificationService get value => NotificationService._();
  NotificationService._();

  Future<void> init() async {
    tz.initializeTimeZones();
  }

  Future<void> checkPermission() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(alert: true, badge: true, sound: true);
    } else if (defaultTargetPlatform == TargetPlatform.macOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(alert: true, badge: true, sound: true);
    }
  }

  Future<void> cancelNotification([List<int>? ids]) async {
    ids == null
        ? await flutterLocalNotificationsPlugin.cancelAll()
        : Future.wait(
            ids.map((id) => flutterLocalNotificationsPlugin.cancel(id)),
          );
  }

  Future<void> schedule(int id, DateTime at, DateTimeComponents day,
          {String? title, String? body}) async =>
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.now(tz.local).add(at.difference(DateTime.now())),
        notificationDetails(channel),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: day,
        payload: '',
      );

  NotificationDetails notificationDetails(AndroidNotificationChannel channel) =>
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          importance: channel.importance,
          priority: Priority.max,
          playSound: channel.playSound,
          enableVibration: channel.enableVibration,
          vibrationPattern: channel.vibrationPattern,
          color: Colors.transparent,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: channel.importance == Importance.high,
          presentBadge: channel.showBadge,
          presentSound: channel.playSound,
        ),
        macOS: DarwinNotificationDetails(
          presentAlert: channel.importance == Importance.high,
          presentBadge: channel.showBadge,
          presentSound: channel.playSound,
        ),
      );
}

AndroidNotificationChannel channel = AndroidNotificationChannel(
  appConfig.configs['base']['app_id']!,
  'TodoSprint',
  description: 'This channel is used for important notifications.',
  importance: Importance.high,
  playSound: true,
  enableVibration: true,
  vibrationPattern: Int64List.fromList([0, 500, 1500, 2000]),
);
