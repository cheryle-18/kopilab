import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class NotificationService {
  NotificationService();
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<NotificationResponse?>();
  final BehaviorSubject<String> behaviorSubject = BehaviorSubject();

  final id = 0;

  Future<void> setup() async {
    const androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidSetting);

    await _notifications.initialize(initSettings).then((_) {
      debugPrint('_');
    }).catchError((Object error) {
      debugPrint('Plugin Error: $error');
    });
  }

  Future<NotificationDetails> _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'OBA',
        'Demo Background Task',
        importance: Importance.max,
        ticker: "ticker",
        styleInformation: DefaultStyleInformation(true, true),
        // playSound: true,
      ),
    );
  }

  Future<void> init({bool initScheduled = false}) async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    var settings = InitializationSettings(android: androidSettings);

    await _notifications.initialize(
      settings
    );
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async => {
    await _notifications.show(
      id, title, body,
      await _notificationDetails(),
      payload: payload
    )
  };
}