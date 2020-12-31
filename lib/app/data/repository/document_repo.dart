import 'package:thor_flutter/app/data/model/bill.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/provider/remote/document_api.dart';

class DocumentRepo {
  final DocumentAPI _documentApi = Get.find<DocumentAPI>();

  Future<List<Bill>> requestBills(String type) async {
    return _documentApi.requestBills(type);
  }
}
