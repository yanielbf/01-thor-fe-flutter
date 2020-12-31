import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/about_us/about_us_controller.dart';

class AboutUsPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsController>(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Acerca de nosotros"),
            elevation: 0.0,
          ),
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
                ],
              ),
            ),
          ));
    });
  }
}
