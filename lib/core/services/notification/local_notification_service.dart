import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hackathontemplate/core/locator/locator.dart';
import 'package:hackathontemplate/feature/bottom_nav/contacts/screens/contacts_screen.dart';
import 'package:hackathontemplate/feature/home/view_model/home_view_model.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  LocalNotificationService();

  static final HomeViewModel _homeViewModel = locator<HomeViewModel>();

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
    requestSoundPermission: false,
    requestBadgePermission: false,
    requestAlertPermission: false,
  );

  void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  static Future<void> init() async {
    //Initialization Settings for Android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    //Initialization Settings for iOS
    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    //InitializationSettings for initializing settings for both platforms (Android & iOS)
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (payload) => selectNotification(payload),
    );
  }

  static Future<dynamic> selectNotification(String? payload) async {
    /* await Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => ContactsScreen()),
    );*/
    _homeViewModel.isStatusEmergency = false;
    cancelNotifications();
  }

  static const AndroidNotificationDetails _androidNotificationDetails =
      AndroidNotificationDetails(
    'channel ID',
    'channel name',
    channelDescription: "channel description",
    priority: Priority.max,
    importance: Importance.high,
  );

  static const IOSNotificationDetails _iosNotificationDetails =
      IOSNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
    badgeNumber: 0,
    attachments: [],
    subtitle: "subtitle",
    threadIdentifier: "",
  );

  static const NotificationDetails platformChannelSpecifics =
      NotificationDetails(
    android: _androidNotificationDetails,
    iOS: _iosNotificationDetails,
  );

  Future showNotifications({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      flutterLocalNotificationsPlugin
          .show(id, title, body, platformChannelSpecifics, payload: payload);

  Future<void> scheduleNotifications() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        "Notification Title",
        "This is the Notification Body!",
        tz.TZDateTime.now(tz.local).add(const Duration(minutes: 5)),
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  static Future<void> cancelNotifications() async {
    await flutterLocalNotificationsPlugin.cancel(0);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
