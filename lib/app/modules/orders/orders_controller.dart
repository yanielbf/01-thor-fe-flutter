import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/saleorder.dart';
import 'package:thor_flutter/app/data/provider/local/launch_url.dart';
import 'package:thor_flutter/app/data/repository/document_repo.dart';
import 'package:thor_flutter/app/global_widgets/app/progress_indicator.dart';
import 'package:thor_flutter/app/global_widgets/error/title_error.dart';

class OrdersController extends GetxController {
  final LauncherUrl launcher = Get.find<LauncherUrl>();
  final DocumentRepo _documentRepo = Get.find<DocumentRepo>();
  List<SaleOrder> orders = [];

  @override
  void onReady() {
    super.onReady();
    _bootstrap();
  }

  void _bootstrap() async {
    await getSaleOrders();
  }

  Future<void> getSaleOrders() async {
    ProggresIndicatorCC.processRequest();
    try {
      orders = await _documentRepo.requestOrders();
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
