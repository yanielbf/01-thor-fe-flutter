import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/bills/bills_controller.dart';

class BillsPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BillsController>(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Desarrolladores"),
            elevation: 0.0,
          ),
          body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 150.0),
                  Image.asset('assets/images/logo_otiumtek.png',
                      width: MediaQuery.of(context).size.width * 0.80),
                  SizedBox(height: 25.0),
                  Text('Estimado cliente',
                      style: Theme.of(context).textTheme.headline3),
                  SizedBox(height: 25.0),
                  Text('Esta aplicación es desarrollada por Otiumtek SRL',
                      style: Theme.of(context).textTheme.bodyText2),
                  SizedBox(height: 15.0),
                  Text('Puede contactarnos en:',
                      style: Theme.of(context).textTheme.bodyText2),
                  Text('Correo electrónico: development@otiumtek.com',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .merge(TextStyle(fontWeight: FontWeight.bold))),
                  Text('Whatsapp: +95895159228',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .merge(TextStyle(fontWeight: FontWeight.bold))),
                  SizedBox(height: 25.0),
                  Text('OTIUMTEK',
                      style: Theme.of(context).textTheme.headline1),
                ],
              ),
            ),
          ));
    });
  }
}
