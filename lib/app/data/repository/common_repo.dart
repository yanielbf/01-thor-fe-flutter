import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/setting.dart';
import 'package:thor_flutter/app/data/provider/remote/common_api.dart';

class CommonRepo {
  final CommonAPI _commonApi = Get.find<CommonAPI>();

  Future<Setting> requestSettings() async {
    return _commonApi.requestSettings();
  }
}
