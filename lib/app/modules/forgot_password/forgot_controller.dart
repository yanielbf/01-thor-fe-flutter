import 'package:thor_flutter/app/global_widgets/app/alert_dialog_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/message.dart';
import 'package:thor_flutter/app/data/repository/authentication_repo.dart';
import 'package:thor_flutter/app/global_widgets/alert/alert_content_api_error_widget.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';
import 'package:thor_flutter/app/utils/validation.dart';
import 'package:rules/rules.dart';

class ForgotController extends GetxController {
  final AuthenticationRepo _authenticationRepo = Get.find<AuthenticationRepo>();
  final AppController appCtl = Get.find<AppController>();
  final GlobalKey<FormState> forgotPassFormKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  bool autoValidate = false;
  RxBool isLoading = false.obs;

  String validateEmail(String value) {
    Rule _emailRule = Rule(value,
        name: 'correo electrónico',
        isRequired: true,
        isEmail: true,
        customErrors: validationMessages);
    return _emailRule.hasError ? _emailRule.error : null;
  }

  void executeRecoveryPassword() async {
    if (forgotPassFormKey.currentState.validate()) {
      isLoading.value = true;
      try {
        Message response = await _authenticationRepo
            .requestForgotPassword(emailController.text);
        isLoading.value = false;
        Get.dialog(AlertDialogCC(
          'Enhorabuena',
          content: Text(response.message),
        ));
      } on DioError catch (e) {
        isLoading.value = false;
        if (e.response != null && e.response != null) {
          if (e.response.data is String) {
            Get.dialog(AlertDialogCC('Ha ocurrido un error',
                content: Text(e.response.data['message'])));
          } else {
            Get.dialog(AlertDialogCC('Ha ocurrido un error',
                content: AlertContentApiError(e.response.data)));
          }
        }
      } catch (e) {
        isLoading.value = false;
        Get.dialog(
            AlertDialogCC('Ha ocurrido un error', content: Text(e.toString())));
      }
    } else {
      autoValidate = true;
    }
  }
}
