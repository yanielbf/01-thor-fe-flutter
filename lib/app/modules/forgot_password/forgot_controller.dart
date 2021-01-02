import 'package:thor_flutter/app/data/model/message.dart';
import 'package:thor_flutter/app/data/repository/authentication_repo.dart';
import 'package:thor_flutter/app/global_widgets/app/progress_indicator.dart';
import 'package:thor_flutter/app/global_widgets/button/button_dialog.dart';
import 'package:thor_flutter/app/global_widgets/error/content_error.dart';
import 'package:thor_flutter/app/global_widgets/error/title_error.dart';
import 'package:thor_flutter/app/routes/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rules/rules.dart';

class ForgotController extends GetxController {
  final AuthenticationRepo _authenticationRepo = Get.find<AuthenticationRepo>();

  TextEditingController _email = TextEditingController();

  Rule _emailRule;

  RxString emailError = ''.obs;

  TextEditingController get email => _email;

  void onEmailChanged(String value) {
    validateOnChange('email', value);
  }

  void validateOnChange(String field, value) {
    _emailRule = Rule(
      value,
      name: 'Correo electrónico',
      isRequired: true,
      isEmail: true,
    );
    emailError.value = _emailRule.hasError ? _emailRule.error : '';
  }

  bool isValid() {
    _emailRule = Rule(
      _email.text,
      name: 'Correo electrónico',
      isRequired: true,
      isEmail: true,
    );
    emailError.value = _emailRule.hasError ? _emailRule.error : '';
    return emailError.value == '';
  }

  void doRecoveryPassword() async {
    if (isValid()) {
      ProggresIndicatorCC.processRequest();
      try {
        Message response =
            await _authenticationRepo.requestForgotPassword(_email.text);
        Get.back();
        Get.dialog(AlertDialog(
          title: TitleAlert(title: 'Todo ha ido bien'),
          content: Text(response.message),
          actions: [ButtonDialog(title: 'Cerrar', callback: closeAndGoToLogin)],
        ));
      } on DioError catch (e) {
        Get.back();
        print(e);
        if (e.response != null && e.response != null) {
          Get.dialog(AlertDialog(
              title: TitleAlert(title: 'Ha ocurrido un error'),
              content: ContentError(data: e.response.data)));
        }
      } catch (e) {
        Get.back();
        print(e);
        Get.dialog(AlertDialog(
            title: TitleAlert(title: 'Ha ocurrido un error'),
            content: Text(e.toString())));
      }
    }
  }

  void closeAndGoToLogin() {
    Get.back();
    navigateToLogin();
  }

  void navigateToRegister() async {
    clearData();
    Get.toNamed(AppRoutes.REGISTER);
  }

  void navigateToLogin() async {
    clearData();
    Get.toNamed(AppRoutes.LOGIN);
  }

  void clearData() {
    _email.text = '';
    emailError.value = '';
  }
}
