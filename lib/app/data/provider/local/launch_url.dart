import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class LauncherUrl {
  void launchExternalUrl(String url) async {
    await launch(url);
  }

  void launchWhatsApp(String phone, String message) async {
    String url() {
      if (Platform.isIOS) {
        return "whatsapp://wa.me/$phone/?text=${Uri.parse(message)}";
      } else {
        return "whatsapp://send?phone=$phone&text=${Uri.parse(message)}";
      }
    }

    await launch(url());
  }

  void launchEmail(String mail, String subject) async {
    final Uri _emailLaunchUri = Uri(
        scheme: 'mailto', path: mail, queryParameters: {'subject': subject});

    await launch(_emailLaunchUri.toString());
  }
}
