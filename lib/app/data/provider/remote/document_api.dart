import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/bill.dart';
import 'package:thor_flutter/app/data/model/saleorder.dart';

class DocumentAPI {
  final Dio _dio = Get.find<Dio>();

  Future<List<Bill>> requestBills(String type) async {
    var response = await _dio.get('/bills/bills/$type');
    return (response.data['data'] as List)
        .map((e) => Bill.fromJson(e))
        .toList();
  }

  Future<List<SaleOrder>> requestOrders() async {
    var response = await _dio.get('/saledeliverynotes/saledeliverynotes');
    return (response.data['data'] as List)
        .map((e) => SaleOrder.fromJson(e))
        .toList();
  }
}
