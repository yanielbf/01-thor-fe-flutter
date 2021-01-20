import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/bill.dart';
import 'package:thor_flutter/app/data/provider/local/launch_url.dart';
import 'package:thor_flutter/app/data/repository/document_repo.dart';
import 'package:thor_flutter/app/global_widgets/app/alert_dialog_widget.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';

class BillsController extends GetxController {
  final AppController appCtl = Get.find<AppController>();
  final LauncherUrl launcher = Get.find<LauncherUrl>();
  final DocumentRepo _documentRepo = Get.find<DocumentRepo>();

  List<Bill> bills = [];
  RxString type = 'ordinary-invoice'.obs;
  RxBool isLoading = true.obs;

  @override
  void onReady() {
    super.onReady();
    _bootstrap();
  }

  void _bootstrap() async {
    await getBills();
  }

  Future<void> changeTypeBill(String value) async {
    type.value = value;
    isLoading.value = true;
    bills = [];
    update();
    await getBills();
  }

  Future<void> getBills() async {
    try {
      isLoading.value = true;
      bills = await _documentRepo.requestBills(type.value);
      update();
      isLoading.value = false;
    } on DioError catch (e) {
      isLoading.value = false;
      if (e.response.statusCode == 401) {
        appCtl.closeSession();
        return;
      }
      if (e.response != null && e.response != null) {
        Get.dialog(AlertDialogCC('Ha ocurrido un error',
            content: Text(e.response.data['message'])));
      }
    } catch (e) {
      isLoading.value = false;
      Get.dialog(
          AlertDialogCC('Ha ocurrido un error', content: Text(e.toString())));
    }
  }
}
