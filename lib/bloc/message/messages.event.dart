import 'package:flutterbloc/model/contact_model.dart';

abstract class MessageEvent {}

class ContactMessageEvent extends MessageEvent {
  Contact contact;
  ContactMessageEvent({required this.contact});
}
