import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/state_manager.dart';
import 'package:thor_flutter/app/global_widgets/animation/side_animation.dart';
import 'package:thor_flutter/app/global_widgets/app/loading_widget.dart';
import 'package:thor_flutter/app/global_widgets/button/raised_button_widget.dart';
import 'package:thor_flutter/app/global_widgets/form/text_form_field_widget.dart';
import 'package:thor_flutter/app/modules/forgot_password/forgot_controller.dart';
import 'package:thor_flutter/app/utils/constants.dart';

class ForgotPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(),
          body: Stack(
            children: [
              Center(
                child: Container(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Form(
                      key: _.forgotPassFormKey,
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
                            child: Text('Recupera tu contraseña',
                                style: Theme.of(context).textTheme.bodyText2),
                          ),
                          SizedBox(height: Constants.SPACING_M),
                          SideInAnimation(
                            3,
                            child: TextFormFieldWidget(
                              controller: _.emailController,
                              obscureText: false,
                              hintText: 'Correo electrónico',
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: Icon(FlutterIcons.mail_fea),
                              validator: _.validateEmail,
                            ),
                          ),
                          SizedBox(height: Constants.SPACING_M),
                          SideInAnimation(
                            4,
                            child: RaisedButtonWidget(
                              title: 'Recuperar contraseña',
                              onPressed: () async {
                                if (_.forgotPassFormKey.currentState
                                    .validate()) {
                                  _.forgotPassFormKey.currentState.save();
                                  _.autoValidate = false;
                                  _.executeRecoveryPassword();
                                } else {
                                  _.autoValidate = true;
                                }
                              },
                            ),
                          ),
                          SizedBox(height: Constants.SPACING_S),
                          SideInAnimation(
                            4,
                            child: RaisedButtonWidget(
                              title: 'Acceder',
                              onPressed: () {
                                _.appCtl.navigateBack();
                              },
                            ),
                          ),
                          SizedBox(height: Constants.SPACING_S),
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
