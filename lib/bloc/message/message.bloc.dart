import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/contact/contact_state.dart';
import 'package:flutterbloc/bloc/message/message.state.dart';
import 'package:flutterbloc/bloc/message/messages.event.dart';
import 'package:flutterbloc/model/message_model.dart';
import 'package:flutterbloc/repositories/message_repository.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageRepository messageRepository;

  MessageBloc(
      {required MessageState initialState, required this.messageRepository})
      : super(initialState) {
    on<ContactMessageEvent>((event, emit) async {
      emit(MessageState(
          messages: [],
          requestState: RequestState.Loading,
          currentEvent: event));
      try {
        List<Message> messages =
            await messageRepository.messagesByContact(event.contact.id);
        emit(MessageState(
            messages: messages,
            requestState: RequestState.Loaded,
            currentEvent: event));
      } catch (e) {
        emit(MessageState(
            messages: [],
            requestState: RequestState.Error,
            errorMessage: e.toString(),
            currentEvent: event));
      }
    });
  }
}
