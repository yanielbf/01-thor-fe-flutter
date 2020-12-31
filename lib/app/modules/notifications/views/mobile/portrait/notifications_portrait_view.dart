import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/notifications/notifications_controller.dart';

class NotificationsPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Notificaciones"),
            elevation: 0.0,
          ),
          body: Container());
    });
  }
}
