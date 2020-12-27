import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/customer.dart';
import 'package:thor_flutter/app/data/provider/local/authentication_local.dart';
import 'package:thor_flutter/app/data/provider/remote/authentication_api.dart';

class AuthenticationService {
  final AuthenticationLocal _authenticationLocal =
      Get.find<AuthenticationLocal>();
  final AuthenticationAPI _authenticationApi = Get.find<AuthenticationAPI>();

  Future<Customer> requestLogin(String email, String password) async {
    Customer customer = await _authenticationApi.requestLogin(email, password);
    _authenticationLocal.setSession(customer);
    return customer;
  }
}
