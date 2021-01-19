import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';
import 'package:thor_flutter/app/utils/colors.dart';

class AlertDialogCC extends StatelessWidget {
  final AppController appCtl = Get.find<AppController>();
  final String title;
  final Widget content;
  final VoidCallback yesAction;
  final VoidCallback noAction;
  final VoidCallback otherAction;
  AlertDialogCC(this.title,
      {this.content, this.yesAction, this.noAction, this.otherAction});

  List<Widget> actions() {
    List<Widget> actions = [];
    if (otherAction != null) {
      actions.add(
        FlatButton(
          onPressed: () {
            appCtl.navigateBack();
            otherAction();
          },
          child: Text(
            'Aceptar',
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      );
    }
    if (noAction != null) {
      actions.add(
        FlatButton(
          onPressed: () {
            appCtl.navigateBack();
            noAction();
          },
          child: Text(
            'No',
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      );
    }
    if (yesAction != null) {
      actions.add(
        FlatButton(
          onPressed: () {
            appCtl.navigateBack();
            yesAction();
          },
          child: Text(
            'Si',
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      );
    }
    return actions;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      title: Text(title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2),
      content: content != null ? content : null,
      actions: actions(),
    );
  }
}
