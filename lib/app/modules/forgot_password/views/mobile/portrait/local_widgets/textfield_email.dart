import 'package:thor_flutter/app/global_widgets/form/textfield_widget.dart';
import 'package:thor_flutter/app/modules/forgot_password/forgot_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotController>(
      builder: (_) {
        return Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[200]))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldCC(
                placeholder: 'Correo electrónico',
                callbackChange: (text) => _.onEmailChanged(text),
                controller: _.email,
              ),
              Obx(() {
                return _.emailError.value.toString() != ''
                    ? Column(
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(_.emailError.value.toString(),
                              style: TextStyle(color: Colors.red)),
                        ],
                      )
                    : Container();
              })
            ],
          ),
        );
      },
    );
  }
}
