import 'package:flutterbloc/model/contact_model.dart';

class Message {
  int id;
  String content;
  Contact contact;
  bool sent;

  Message(
      {required this.id,
      required this.content,
      required this.contact,
      required this.sent});
}
