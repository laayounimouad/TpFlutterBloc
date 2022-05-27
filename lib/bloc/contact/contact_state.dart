import 'package:flutterbloc/model/contact_model.dart';

enum RequestState { Loaded, Loading, Error, NONE }

class ContactState {
  List<Contact> contacts = [];
  RequestState requestState;
  String errorMessage;
  ContactState(
      {required this.contacts,
      required this.errorMessage,
      required this.requestState});

  List<Object?> get props => [contacts, requestState, errorMessage];
}

class ContactInitialState extends ContactState {
  ContactInitialState()
      : super(contacts: [], errorMessage: "", requestState: RequestState.NONE);
}
