import 'package:get/get.dart';
import 'package:cubanfood_mobile_flutter/app/data/model/Customer.dart';
import 'package:cubanfood_mobile_flutter/app/data/provider/remote/authentication_api.dart';

class AuthenticationRepo {

  final AuthenticationAPI _authenticationApi = Get.find<AuthenticationAPI>();
  
  Future<Customer> requestCurrentUser() async {
    return _authenticationApi.requestCurrentUser();
  }
}