import 'package:get/get.dart';

class PdfViewerController extends GetxController {
  bool loading = false;

  @override
  void onReady() {
    super.onReady();
    _bootstrap();
  }

  void _bootstrap() async {
    String url = Get.arguments;
    print(url);
    await getDocument(url);
  }

  Future<void> getDocument(String url) async {
    loading = true;
    //document = await PDFDocument.fromURL(url);
    loading = false;
    update();
  }
}
