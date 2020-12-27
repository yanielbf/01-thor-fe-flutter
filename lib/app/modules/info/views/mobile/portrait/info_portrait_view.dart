import 'package:thor_flutter/app/modules/info/info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class InfoPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 100.0),
                  Image.asset('assets/images/logo_simple.png',
                      width: MediaQuery.of(context).size.width * 0.20),
                  SizedBox(height: 25.0),
                  Text('Estimado cliente',
                      style: Theme.of(context).textTheme.headline3),
                  SizedBox(height: 25.0),
                  Text(
                      'Gracias por comprar nuestros productos! \n Tu compra significa mucho para nosotros.',
                      style: Theme.of(context).textTheme.bodyText2),
                  SizedBox(height: 15.0),
                  Text('Puede contactarnos en:',
                      style: Theme.of(context).textTheme.bodyText2),
                  Text('Correo electrónico: thor@gmail.com',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .merge(TextStyle(fontWeight: FontWeight.bold))),
                  Text('Whatsapp: +34526929303',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .merge(TextStyle(fontWeight: FontWeight.bold))),
                  SizedBox(height: 25.0),
                  Text('Thor Provider',
                      style: Theme.of(context).textTheme.headline1),
                  SizedBox(height: 45.0),
                  Text('Aplicación desarrollada por Otiumtek SRL',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .merge(TextStyle(fontWeight: FontWeight.bold))),
                  Text('development@otiumtek.com',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .merge(TextStyle(fontWeight: FontWeight.bold))),
                  Text('+95895159228',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .merge(TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
