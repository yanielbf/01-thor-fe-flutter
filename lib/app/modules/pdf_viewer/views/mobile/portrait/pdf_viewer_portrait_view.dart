import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/pdf_viewer/pdf_viewer_controller.dart';

class PdfViewerPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PdfViewerController>(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Visualizador PDF"),
            elevation: 0.0,
          ),
          body: Center(
              child: Text(
                  'https://app.stelorder.com/app/ControladorPublico?token=AEcihxbJt4Z3xHr6iuepKGBDn5_llUambsDg_zz3eLQOpgjod0BkAqDhL8gLTUKZR4j4tAV304A4tRGtHDmFtZWlVdoe_6Suqj4xXZm6_XceDL-WfE55x6vgaJOzMP3YeZCRH5UgehaaDQNJYmnf_ZYZr6AiWHfU4TkIeFxz7tDCxi0JJBmPcZgc7EeG-iZSvZkFY0rNA_aC1ZYVJFM__coJJOm0JkEabieHE5WebsPU09r8LZkV96BUK0rSMD9GW5Rf2FmTCaLxKYEaslVWuI73OS18MkVCE60T1ep4sfX8ArRdYoxwIxm50PPLU7ibtdC92Dp-yAzEm5GrqmwL7BbVwtYL_cA5L5jz9DkEq9UWFHqrQER5OFrF8ASXwjIAdmaO_UEQBvhpDWkl0cYZ2ZAgNz6SxyIcgVhpIV375iH_3A9ePRGl7QmXD9VQv5wenemg98xyCnSAQYDjiwXcnNBRvFQKY0Q82oc8jnT80rj6fweCV9AGlUj-1PbKnXSKsG8OBnPYsipaN4Z93HhPyct4KCTf23EdjopNKxWknD8HdtBIih2t-Xt7hZrf-txqYUzj6VPi-JOURDgX0nWnDAJQHkl-58xuXVFRJtuQueGV1RSTNmi7qoa6H5M0ENpnGtVmF9vIqJJ0UwYjzds0MTkrEE8T2DkaWg')));
    });
  }
}
