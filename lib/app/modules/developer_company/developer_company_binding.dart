import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/developer_company/developer_company_controller.dart';

class DeveloperCompanyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DeveloperCompanyController());
  }
}
