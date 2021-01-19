import 'package:flutter/material.dart';

class AlertContentApiError extends StatelessWidget {
  final Map<String, dynamic> data;
  AlertContentApiError(this.data);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    if (data['errors'] != null) {
      data['errors'].forEach((i, value) {
        widgets.add(Text("- ${value[0]}"));
      });
    } else {
      widgets.add(Text(data['message']));
    }

    return Column(
      children: widgets,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
    );
  }
}
