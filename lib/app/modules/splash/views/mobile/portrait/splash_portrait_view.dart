import 'package:thor_flutter/app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:thor_flutter/app/utils/constants.dart';

class SplashPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) {
        return Scaffold(
            body: SafeArea(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 30.0),
                    width: double.infinity,
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(Constants.IMAGE_LOGO,
                                width: MediaQuery.of(context).size.width *
                                    Constants.IMAGE_LOGO_SIZE),
                          ],
                        )))));
      },
    );
  }
}
