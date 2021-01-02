import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/bill.dart';
import 'package:thor_flutter/app/data/provider/local/launch_url.dart';
import 'package:thor_flutter/app/data/repository/document_repo.dart';
import 'package:thor_flutter/app/global_widgets/app/progress_indicator.dart';
import 'package:thor_flutter/app/global_widgets/error/title_error.dart';

class BillsController extends GetxController {
  final LauncherUrl launcher = Get.find<LauncherUrl>();
  final DocumentRepo _documentRepo = Get.find<DocumentRepo>();
  List<Bill> bills = [];
  String type = 'ordinary-invoice';

  @override
  void onReady() {
    super.onReady();
    _bootstrap();
  }

  void _bootstrap() async {
    await getBills();
  }

  Future<void> changeTypeBill(String value) async {
    type = value;
    update();
    await getBills();
  }

  Future<void> getBills() async {
    ProggresIndicatorCC.processRequest();
    try {
      bills = await _documentRepo.requestBills(type);
      update();
      Get.back();
    } on DioError catch (e) {
      Get.back();
      if (e.response != null && e.response != null) {
        Get.dialog(AlertDialog(
            title: TitleAlert(title: 'Ha ocurrido un error'),
            content: Text(e.response.data['message'])));
      }
    } catch (e) {
      print(e);
      Get.back();
      Get.dialog(AlertDialog(
          title: TitleAlert(title: 'Ha ocurrido un error'),
          content: Text(e.toString())));
    }
  }
}
