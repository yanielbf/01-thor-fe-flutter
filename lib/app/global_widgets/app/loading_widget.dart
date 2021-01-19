import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  LoadingOverlay({this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            color: Colors.white,
            child: Center(
              child: SpinKitFadingCircle(
                color: Colors.red,
                size: 45.0,
              ),
            ),
          )
        : Container();
  }
}
