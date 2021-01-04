import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rules/rules.dart';
import 'package:thor_flutter/app/data/model/customer.dart';
import 'package:thor_flutter/app/data/provider/firebase/firebase_notification_handler.dart';
import 'package:thor_flutter/app/data/service/authentication_service.dart';
import 'package:thor_flutter/app/global_widgets/error/title_error.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';
import 'package:thor_flutter/app/routes/app_routes.dart';
import 'package:thor_flutter/app/utils/validation.dart';

class LoginController extends GetxController {
  final AuthenticationService _authenticationService =
      Get.find<AuthenticationService>();
  final AppController appController = Get.find<AppController>();
  final formKey = GlobalKey<FormState>();

  FirebaseNotifications firebaseNotifications = FirebaseNotifications();

  String _email;
  String _password;

  bool _autoValidate = false;
  bool _isLoading = false;

  String get email => _email;
  String get password => _password;
  bool get autoValidate => _autoValidate;
  bool get isLoading => _isLoading;

  @override
  void onReady() {
    super.onReady();
    firebaseNotifications.setupFirebase(Get.context);
  }

  set autoValidate(bool value) {
    _autoValidate = value;
    update(['textfield-email', 'textfield-password']);
  }

  void onSavedEmail(String email) {
    _email = email;
    update(['textfield-email']);
  }

  void onSavedPassword(String password) {
    _password = password;
    update(['textfield-password']);
  }

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

  void doLogin() async {
    print(formKey.currentState.validate());
    if (formKey.currentState.validate()) {
      try {
        Customer customer =
            await _authenticationService.requestLogin(_email, _password);
        appController.customer = customer;
        Get.offAllNamed(AppRoutes.NAVIGATIONBAR);
      } on DioError catch (e) {
        if (e.response != null && e.response != null) {
          if (e.response.data is String) {
            Get.dialog(AlertDialog(
                title: TitleAlert(title: 'Ha ocurrido un error'),
                content: Text(e.response.data)));
          } else {
            Get.dialog(AlertDialog(
                title: TitleAlert(title: 'Ha ocurrido un error'),
                content: Text(e.response.data['message'])));
          }
        }
      } catch (e) {
        print(e);
        Get.dialog(AlertDialog(
            title: TitleAlert(title: 'Ha ocurrido un error'),
            content: Text(e.toString())));
      }
    } else {
      _autoValidate = true;
    }
  }
}
