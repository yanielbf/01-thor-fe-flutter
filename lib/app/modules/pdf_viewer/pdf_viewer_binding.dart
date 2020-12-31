import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/pdf_viewer/pdf_viewer_controller.dart';

class PdfViewerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PdfViewerController());
  }
}
