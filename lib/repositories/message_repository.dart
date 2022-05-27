import 'package:flutterbloc/model/message_model.dart';

class MessageRepository {
  List<Message> messages = [
    Message(id: 1, content: "Hello", idContact: 1, sent: true),
    Message(id: 2, content: "Hello how have been", idContact: 1, sent: false),
    Message(id: 7, content: "great, and you ?", idContact: 1, sent: true),
    Message(
        id: 3,
        content: "good morning, did you wake up ",
        idContact: 2,
        sent: true),
    Message(id: 4, content: "Yes", idContact: 2, sent: true),
    Message(id: 5, content: "hello again", idContact: 2, sent: false),
    Message(id: 6, content: "by", idContact: 2, sent: false),
    Message(id: 8, content: "by", idContact: 1, sent: false),
  ];

  Future<List<Message>> messagesByContact(int idContact) async {
    var future = await Future.delayed(const Duration(seconds: 1));
    return messages.where((element) => element.idContact == idContact).toList();
  }
}
