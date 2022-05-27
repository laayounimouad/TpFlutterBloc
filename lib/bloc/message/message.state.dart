import 'package:flutterbloc/bloc/contact/contact_state.dart';
import 'package:flutterbloc/bloc/message/messages.event.dart';
import 'package:flutterbloc/model/message_model.dart';

class MessageState {
  List<Message> messages;
  RequestState requestState;
  String errorMessage;
  MessageEvent currentEvent;
  MessageState(
      {required this.messages,
      this.requestState = RequestState.NONE,
      this.errorMessage = "",
      required this.currentEvent});
}
