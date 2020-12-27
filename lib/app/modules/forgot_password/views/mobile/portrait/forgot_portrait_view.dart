import 'package:thor_flutter/app/modules/forgot_password/forgot_controller.dart';
import 'package:thor_flutter/app/modules/forgot_password/views/mobile/portrait/local_widgets/button_recovery.dart';
import 'package:thor_flutter/app/theme/color_theme.dart';
import 'package:thor_flutter/app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:thor_flutter/app/modules/forgot_password/views/mobile/portrait/local_widgets/button_login.dart';
import 'package:thor_flutter/app/modules/forgot_password/views/mobile/portrait/local_widgets/button_register.dart';
import 'package:thor_flutter/app/modules/forgot_password/views/mobile/portrait/local_widgets/textfield_email.dart';

class ForgotPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotController>(
      builder: (_) {
        return Scaffold(
            body: SingleChildScrollView(
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            colors: ColorThemeCC.backgroundColorPrimary)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 60.0),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('La Cocina Cubana',
                                  style: TextThemeCC.headerTextStyle
                                      .merge(TextStyle(color: Colors.white))),
                              Text('Recuperar contraseña',
                                  style: TextThemeCC.subHeaderTextStyle
                                      .merge(TextStyle(color: Colors.white))),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(60.0),
                                  topRight: Radius.circular(60.0))),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 10.0,
                                ),
                                Image.asset(
                                  'images/logo.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Color.fromRGBO(255, 95, 27, .3),
                                            blurRadius: 20.0,
                                            offset: Offset(0, 10))
                                      ]),
                                  child: Column(
                                    children: [
                                      TextFieldEmail(),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 60.0,
                                ),
                                SizedBox(
                                  height: 40.0,
                                ),
                                ButtonRecovery(),
                                SizedBox(
                                  height: 60.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(child: ButtonLogin()),
                                    SizedBox(width: 30.0),
                                    Expanded(
                                      child: ButtonRegister(),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 40.0,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ))));
      },
    );
  }
}
