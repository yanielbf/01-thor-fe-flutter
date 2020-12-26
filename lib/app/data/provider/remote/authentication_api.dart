import 'package:cubanfood_mobile_flutter/app/data/model/Customer.dart';
import 'package:cubanfood_mobile_flutter/app/data/provider/local/authentication_local.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthenticationAPI {

  final Dio _dio = Get.find<Dio>();

  Future<Customer> requestLogin(String email, String password) async {
    var response = await _dio.post('/auth/login', data: {"email": email, "password": password});
    return Customer.fromJson(response.data);
  }

  Future<Customer> requestCurrentUser() async {
    var response = await _dio.get('/auth/me');
    return Customer.fromJson(response.data);
  }

}