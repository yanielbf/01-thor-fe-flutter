import 'package:thor_flutter/app/data/model/customer.dart';
import 'package:thor_flutter/app/data/model/message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthenticationAPI {
  final Dio _dio = Get.find<Dio>();

  Future<Customer> requestLogin(String email, String password) async {
    var response = await _dio
        .post('/auth/login', data: {"email": email, "password": password});
    return Customer.fromJson(response.data);
  }

  Future<Message> requestRegister(String name, String email, String password,
      String confirmPassword, String phone) async {
    var response = await _dio.post('/auth/register', data: {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": confirmPassword,
      "phone": phone
    });
    return Message.fromJson(response.data);
  }

  Future<Message> requestForgotPassword(String email) async {
    var response =
        await _dio.post('/auth/forgot-password', data: {"email": email});
    return Message.fromJson(response.data);
  }

  Future<Customer> requestCurrentUser() async {
    var response = await _dio.get('/auth/me');
    return Customer.fromJson(response.data);
  }
}
