import 'package:flutterbloc/model/contact_model.dart';

class ContactRepository {
  List<Contact> contacts = [
    Contact(
        id: 1,
        name: "name1",
        group: "BDCC",
        profile: "AH",
        lastMessage: "hello",
        lastMessageDate: "21/05/2022"),
    Contact(
        id: 2,
        name: "name2",
        group: "GLSID",
        profile: "AB",
        lastMessage: "hello",
        lastMessageDate: "21/05/2022"),
    Contact(
        id: 3,
        name: "name3",
        group: "BDCC",
        profile: "EH",
        lastMessage: "hello",
        lastMessageDate: "25/04/2022"),
    Contact(
        id: 4,
        name: "name4",
        group: "GLSID",
        profile: "RT",
        lastMessage: "hello",
        lastMessageDate: "22/05/2022"),
    Contact(
        id: 5,
        name: "name5",
        group: "BDCC",
        profile: "AB",
        lastMessage: "hello",
        lastMessageDate: "20/05/2022"),
  ];

  Future<List<Contact>> allContacts() async {
    var future = await Future.delayed(Duration(seconds: 1));
    return contacts;
  }

  Future<List<Contact>> contactsByGroup(String group) async {
    var future = await Future.delayed(Duration(seconds: 1));
    print("$group ;;;");
    return contacts.where((element) => element.group == group).toList();
  }
}
