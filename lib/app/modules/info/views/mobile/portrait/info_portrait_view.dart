import 'package:thor_flutter/app/modules/info/info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:thor_flutter/app/utils/constants.dart';

class InfoPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Container(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Constants.IMAGE_LOGO_SIMPLE,
                        width: MediaQuery.of(context).size.width *
                            Constants.IMAGE_LOGO_SIZE),
                    SizedBox(height: Constants.SPACING_S),
                    Text('Estimado cliente',
                        style: Theme.of(context).textTheme.headline3),
                    SizedBox(height: Constants.SPACING_S),
                    Text(
                        'Gracias por comprar nuestros productos! Tu compra significa mucho para nosotros.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2),
                    SizedBox(height: Constants.SPACING_S),
                    Text('Puede contactarnos en:',
                        style: Theme.of(context).textTheme.bodyText2),
                    Text('Correo electrónico: thor@gmail.com',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .merge(TextStyle(fontWeight: FontWeight.bold))),
                    Text('Whatsapp: +34-526929303',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .merge(TextStyle(fontWeight: FontWeight.bold))),
                    SizedBox(height: Constants.SPACING_S),
                    Text('Thor Provider',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .merge(TextStyle(fontWeight: FontWeight.bold))),
                    SizedBox(height: Constants.SPACING_L),
                    Text('Aplicación desarrollada por Otiumtek SRL',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2),
                    Text('development@otiumtek.com',
                        style: Theme.of(context).textTheme.bodyText2),
                    Text('+598-95159228',
                        style: Theme.of(context).textTheme.bodyText2),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
