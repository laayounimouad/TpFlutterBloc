import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/contact/contact_event.dart';
import 'package:flutterbloc/bloc/contact/contact_state.dart';
import 'package:flutterbloc/model/contact_model.dart';
import 'package:flutterbloc/repositories/contact_repository.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactRepository contactRepository;
  ContactBloc(ContactState contactState, this.contactRepository)
      : super(contactState) {
    on((event, emit) async {
      if (event is LoadAllContactsEvent) {
        emit(ContactState(
            contacts: [],
            errorMessage: "error",
            requestState: RequestState.NONE));
        List<Contact> contacts = await contactRepository.allContacts();
        emit(ContactState(
            contacts: contactRepository.contacts,
            errorMessage: "error message",
            requestState: RequestState.Loaded));
      } else if (event is LoadBDCContactsEvent) {
        emit(ContactState(
            contacts: [],
            errorMessage: "error",
            requestState: RequestState.NONE));
        List<Contact> contacts =
            await contactRepository.contactsByGroup("BDCC");
        emit(ContactState(
            contacts: contacts,
            errorMessage: "error message",
            requestState: RequestState.Loaded));
      } else if (event is LoadGLSIDContactsEvent) {
        emit(ContactState(
            contacts: [],
            errorMessage: "error",
            requestState: RequestState.NONE));
        List<Contact> contacts =
            await contactRepository.contactsByGroup("GLSID");
        emit(ContactState(
            contacts: contacts,
            errorMessage: "error message",
            requestState: RequestState.Loaded));
      }
    });
  }
}
