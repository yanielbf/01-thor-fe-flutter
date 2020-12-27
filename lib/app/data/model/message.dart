import 'package:meta/meta.dart';

class Message {
  Message({@required this.message});

  String message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      Message(message: json["message"]);

  Map<String, dynamic> toJson() => {"message": message};
}
