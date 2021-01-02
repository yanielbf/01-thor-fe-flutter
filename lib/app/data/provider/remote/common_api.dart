import 'package:thor_flutter/app/data/model/customer.dart';
import 'package:thor_flutter/app/data/model/message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/setting.dart';

class CommonAPI {
  final Dio _dio = Get.find<Dio>();

  Future<Setting> requestSettings() async {
    var response = await _dio.get('/settings/settings');
    return Setting.fromJson(response.data);
  }
}
