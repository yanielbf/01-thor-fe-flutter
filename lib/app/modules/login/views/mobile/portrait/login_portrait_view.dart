import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/global_widgets/animation/fade_animation.dart';
import 'package:thor_flutter/app/global_widgets/animation/side_animation.dart';
import 'package:thor_flutter/app/global_widgets/button/raised_button_widget.dart';
import 'package:thor_flutter/app/global_widgets/form/text_form_field_widget.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';
import 'package:thor_flutter/app/modules/login/login_controller.dart';
import 'package:thor_flutter/app/routes/app_routes.dart';
import 'package:thor_flutter/app/utils/screens.dart';

class LoginPortraitView extends StatelessWidget {
  AppController appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return Scaffold(
          body: Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Form(
                key: _.formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 120.0),
                    SideInAnimation(
                      1,
                      child: Center(
                        child: Container(
                          child: Center(
                            child: Image.asset('assets/images/logo_simple.png',
                                width:
                                    MediaQuery.of(context).size.width * 0.45),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 18.0),
                    SideInAnimation(2,
                        child: Text('Thor provider',
                            style: Theme.of(context).textTheme.headline1)),
                    SizedBox(height: 12.0),
                    SideInAnimation(
                      2,
                      child: Text('Accede para continuar',
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                    SizedBox(height: 35.0),
                    SideInAnimation(
                      3,
                      child: TextFormFieldWidget(
                        obscureText: false,
                        hintText: 'Correo electrónico',
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icon(FlutterIcons.mail_fea),
                        validator: _.validateEmail,
                        onChanged: (value) => _.onSavedEmail(value),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    SideInAnimation(
                      3,
                      child: TextFormFieldWidget(
                        obscureText: true,
                        hintText: 'Contraseña',
                        keyboardType: TextInputType.text,
                        prefixIcon: Icon(FlutterIcons.lock_fea),
                        validator: _.validatePassword,
                        onChanged: (value) => _.onSavedPassword(value),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    SideInAnimation(
                      4,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            //Get.to(ResetPasswordPage());
                          },
                          child: Text(
                            'Olvidaste la contraseña?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontSize: 14.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    SideInAnimation(
                      4,
                      child: RaisedButtonWidget(
                        title: 'Acceder',
                        onPressed: () async {
                          if (_.formKey.currentState.validate()) {
                            _.formKey.currentState.save();
                            _.autoValidate = false;
                            _.doLogin();
                          } else {
                            _.autoValidate = true;
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 15.0),
                    FadeInAnimation(5, child: customVerticalDivider(context)),
                    SizedBox(height: 15.0),
                    FadeInAnimation(
                      5,
                      child: RaisedButtonWidget(
                        title: 'Acerca de nosotros',
                        onPressed: () async {
                          appController.navigateToRoute(AppRoutes.INFO);
                        },
                      ),
                    ),
                    SizedBox(height: 15.0),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Row customVerticalDivider(BuildContext context) {
  return Row(
    children: <Widget>[
      Expanded(
        child: Container(
          width: Screen.width(context),
          height: .5,
          color: Theme.of(context).accentColor,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          'O',
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      Expanded(
        child: Container(
          width: Screen.width(context),
          height: .5,
          color: Theme.of(context).accentColor,
        ),
      ),
    ],
  );
}
