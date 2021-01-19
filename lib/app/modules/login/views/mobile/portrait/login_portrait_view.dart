import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/global_widgets/animation/side_animation.dart';
import 'package:thor_flutter/app/global_widgets/app/loading_widget.dart';
import 'package:thor_flutter/app/global_widgets/button/raised_button_widget.dart';
import 'package:thor_flutter/app/global_widgets/form/text_form_field_widget.dart';
import 'package:thor_flutter/app/modules/login/login_controller.dart';
import 'package:thor_flutter/app/routes/app_routes.dart';
import 'package:thor_flutter/app/utils/colors.dart';
import 'package:thor_flutter/app/utils/constants.dart';

class LoginPortraitView extends StatelessWidget {
  Widget actions() {
    return GetBuilder<LoginController>(
      builder: (_) {
        return Obx(() {
          if (!_.isLoading.value) {
            return IconButton(
              icon: Icon(
                FlutterIcons.info_outline_mdi,
                color: kPrimaryColor,
              ),
              onPressed: () {
                _.appCtl.navigateToRoute(AppRoutes.INFO);
              },
            );
          }
          if (_.isLoading.value) {
            return SizedBox();
          }
          return null;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            actions: [actions()],
          ),
          body: Stack(
            children: [
              Center(
                child: Container(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Form(
                      key: _.formKey,
                      child: Column(
                        children: <Widget>[
                          SideInAnimation(
                            1,
                            child: Center(
                              child: Container(
                                child: Center(
                                  child: Image.asset(
                                      Constants.IMAGE_LOGO_SIMPLE,
                                      width: MediaQuery.of(context).size.width *
                                          Constants.IMAGE_LOGO_SIZE),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: Constants.SPACING_S),
                          SideInAnimation(
                            2,
                            child: Text('Accede para continuar',
                                style: Theme.of(context).textTheme.bodyText2),
                          ),
                          SizedBox(height: Constants.SPACING_M),
                          SideInAnimation(
                            3,
                            child: TextFormFieldWidget(
                              controller: _.email,
                              obscureText: false,
                              hintText: 'Correo electrónico',
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: Icon(FlutterIcons.mail_fea),
                              validator: _.validateEmail,
                            ),
                          ),
                          SizedBox(height: Constants.SPACING_S),
                          SideInAnimation(
                            3,
                            child: TextFormFieldWidget(
                              controller: _.password,
                              obscureText: true,
                              hintText: 'Contraseña',
                              keyboardType: TextInputType.text,
                              prefixIcon: Icon(FlutterIcons.lock_fea),
                              validator: _.validatePassword,
                            ),
                          ),
                          SizedBox(height: Constants.SPACING_S),
                          SideInAnimation(
                            4,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  _.appCtl.navigateToRoute(AppRoutes.FORGOT);
                                },
                                child: Text(
                                  'Olvidaste la contraseña?',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          SideInAnimation(
                            5,
                            child: RaisedButtonWidget(
                              title: 'Acceder',
                              onPressed: () async {
                                if (_.formKey.currentState.validate()) {
                                  _.autoValidate = false;
                                  _.executeLogin();
                                } else {
                                  _.autoValidate = true;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Obx(() => LoadingOverlay(
                    isLoading: _.isLoading.value,
                  )),
            ],
          ),
        );
      },
    );
  }
}
