import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/message.dart';
import 'package:thor_flutter/app/data/model/customer.dart';
import 'package:thor_flutter/app/data/provider/remote/authentication_api.dart';

class AuthenticationRepo {
  final AuthenticationAPI _authenticationApi = Get.find<AuthenticationAPI>();

  Future<Customer> requestLogin(String email, String password) async {
    return _authenticationApi.requestLogin(email, password);
  }

  Future<Message> requestRegister(String name, String email, String password,
      String confirmPassword, String phone) async {
    return _authenticationApi.requestRegister(
        name, email, password, confirmPassword, phone);
  }

  Future<Message> requestForgotPassword(String email) async {
    return _authenticationApi.requestForgotPassword(email);
  }

  Future<Customer> requestCurrentUser() async {
    return _authenticationApi.requestCurrentUser();
  }
}
