import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:thor_flutter/app/modules/pdf_viewer/pdf_viewer_controller.dart';
import 'package:thor_flutter/app/modules/pdf_viewer/views/mobile/portrait/pdf_viewer_portrait_view.dart';
import 'package:thor_flutter/app/utils/responsive/responsive_orientation_builder.dart';
import 'package:thor_flutter/app/utils/responsive/screentype_builder.dart';

class PdfViewerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PdfViewerController>(
        builder: (_) => ScreenTypeBuilder(
            mobile: ResponsiveOrientationBuilder(
                portrait: PdfViewerPortraitView(), landscape: Container()),
            tablet: ResponsiveOrientationBuilder(
                portrait: Container(), landscape: Container())));
  }
}
