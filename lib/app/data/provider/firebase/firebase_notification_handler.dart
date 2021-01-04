import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:thor_flutter/app/data/provider/firebase/notification_handler.dart';

class FirebaseNotifications {
  FirebaseMessaging _messaging;
  BuildContext myContext;

  void setupFirebase(BuildContext context, Function callback) {
    _messaging = FirebaseMessaging();
    NotificationHandler.initNotification(context);
    firebaseCloudMessagingListener(context, callback);
    myContext = context;
  }

  void firebaseCloudMessagingListener(BuildContext context, Function callback) {
    _messaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _messaging.onIosSettingsRegistered.listen((event) {
      print('Setting register $event');
    });
    _messaging.getToken().then((value) => print('Token $value'));
    _messaging
        .subscribeToTopic('thor_socket')
        .whenComplete(() => print('Suscribe OK'));
    Future.delayed(Duration(seconds: 1), () {
      _messaging.configure(
          onBackgroundMessage:
              Platform.isIOS ? null : fcmBackgroundMessageHandler,
          onMessage: (Map<String, dynamic> message) async {
            if (Platform.isAndroid) {
              callback(message['data']['body']);
              showNotification(
                  message['data']['title'], message['data']['body']);
            } else if (Platform.isIOS) {
              showNotification(message['notification']['title'],
                  message['notification']['body']);
            }
          },
          onResume: (Map<String, dynamic> message) async {
            if (Platform.isIOS) {
              showDialog(
                  context: myContext,
                  builder: (_) => CupertinoAlertDialog(
                          title: Text(message['title']),
                          content: Text(message['body']),
                          actions: [
                            CupertinoDialogAction(
                              isDefaultAction: true,
                              child: Text('OK'),
                              onPressed: () {
                                print('Notification');
                                Navigator.of(_, rootNavigator: true).pop();
                              },
                            )
                          ]));
            }
          },
          onLaunch: (Map<String, dynamic> message) async {
            if (Platform.isIOS) {
              showDialog(
                  context: myContext,
                  builder: (_) => CupertinoAlertDialog(
                          title: Text(message['title']),
                          content: Text(message['body']),
                          actions: [
                            CupertinoDialogAction(
                              isDefaultAction: true,
                              child: Text('OK'),
                              onPressed: () {
                                print('Notification');
                                Navigator.of(_, rootNavigator: true).pop();
                              },
                            )
                          ]));
            }
          });
    });
  }

  static Future fcmBackgroundMessageHandler(Map<String, dynamic> message) {
    dynamic data = message['data'];
    showNotification(data['title'], data['body']);
    return Future<void>.value();
  }

  static void showNotification(title, body) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'app.otiumtek.thor_flutter.thor_flutter',
        'channel',
        'My channel description');
    var iosPlatformSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iosPlatformSpecifics);

    await NotificationHandler.flutterLocalNoificationPlugin
        .show(0, title, body, platformChannelSpecifics, payload: 'My payload');
  }
}
