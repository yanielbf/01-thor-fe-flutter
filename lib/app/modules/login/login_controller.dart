import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rules/rules.dart';
import 'package:thor_flutter/app/data/model/customer.dart';
import 'package:thor_flutter/app/data/service/authentication_service.dart';
import 'package:thor_flutter/app/global_widgets/alert/alert_content_api_error_widget.dart';
import 'package:thor_flutter/app/global_widgets/app/alert_dialog_widget.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';
import 'package:thor_flutter/app/routes/app_routes.dart';
import 'package:thor_flutter/app/utils/validation.dart';

class LoginController extends GetxController {
  final AuthenticationService _authenticationService =
      Get.find<AuthenticationService>();
  final AppController appCtl = Get.find<AppController>();
  final formKey = GlobalKey<FormState>();

  var email = TextEditingController();
  var password = TextEditingController();

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

  String validatePassword(String value) {
    Rule _passwordRule = Rule(value,
        name: 'contraseña', isRequired: true, customErrors: validationMessages);
    return _passwordRule.hasError ? _passwordRule.error : null;
  }

  void executeLogin() async {
    if (formKey.currentState.validate()) {
      try {
        isLoading.value = true;
        Customer customer = await _authenticationService.requestLogin(
            email.text, password.text);
        appCtl.customer = customer;
        appCtl.navigateToRoute(AppRoutes.NAVIGATIONBAR, removeStack: true);
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
