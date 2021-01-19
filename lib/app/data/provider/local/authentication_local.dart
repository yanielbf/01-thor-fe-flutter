import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:thor_flutter/app/data/model/customer.dart';

class AuthenticationLocal {
  final GetStorage _storage = Get.find<GetStorage>();
  static const SESSION = 'session';

  Future<void> setSession(Customer customer) async {
    await _storage.write(SESSION, jsonEncode(customer.toJson()));
  }

  Future<Customer> getSession() async {
    final String data = await _storage.read(SESSION);
    if (data != null) {
      final Customer customer = Customer.fromJson(jsonDecode(data));

      if (customer.expirationAt != null &&
          DateTime.now().isBefore(customer.expirationAt)) {
        return customer;
      }
      return null;
    }
    return null;
  }

  Future<String> getToken() async {
    final String data = await _storage.read(SESSION);
    if (data != null) {
      final Customer customer = Customer.fromJson(jsonDecode(data));
      if (DateTime.now().isBefore(customer.expirationAt)) {
        return customer.token;
      }
      return '';
    }
    return '';
  }

  Future<void> removeSession() async {
    await _storage.remove(SESSION);
  }
}
