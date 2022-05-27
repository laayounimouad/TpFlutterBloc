import 'package:flutterbloc/model/contact_model.dart';

class Message {
  int id;
  String content;
  int idContact;
  bool sent;

  Message(
      {required this.id,
      required this.content,
      required this.idContact,
      required this.sent});
}
