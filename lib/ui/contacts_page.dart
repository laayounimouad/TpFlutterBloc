import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/contact/contact_bloc.dart';
import 'package:flutterbloc/bloc/contact/contact_event.dart';
import 'package:flutterbloc/bloc/contact/contact_state.dart';
import 'package:flutterbloc/bloc/message/message.bloc.dart';
import 'package:flutterbloc/bloc/message/messages.event.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contacts")),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 10, bottom: 10),
                child: BlocBuilder<ContactBloc, ContactState>(
                  builder: (context, state) => ElevatedButton(
                      onPressed: () {
                        context.read<ContactBloc>().add(LoadAllContactsEvent());
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent[100]),
                      child: const Text("All")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 10, bottom: 10),
                child: BlocBuilder<ContactBloc, ContactState>(
                  builder: (context, state) => ElevatedButton(
                      onPressed: () {
                        context
                            .read<ContactBloc>()
                            .add(LoadGLSIDContactsEvent());
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.orange),
                      child: const Text("GLSID")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 10, bottom: 10),
                child: BlocBuilder<ContactBloc, ContactState>(
                  builder: (context, state) => ElevatedButton(
                      onPressed: () {
                        context.read<ContactBloc>().add(LoadBDCContactsEvent());
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.orange),
                      child: const Text("BDCC")),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Center(
              child: Title(
                  color: Colors.black,
                  child: const Text("Contacts",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 28))),
            ),
          ),
          Expanded(child:
              BlocBuilder<ContactBloc, ContactState>(builder: (context, state) {
            if (state.requestState == RequestState.Loading) {
              return const Center(
                  child: SizedBox(
                      child: CircularProgressIndicator(color: Colors.blue),
                      height: 100.0,
                      width: 100.0));
            }
            if (state.requestState == RequestState.Loaded) {
              return ListView.builder(
                  itemCount: state.contacts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.accessibility_rounded),
                        title: Text(state.contacts[index].name),
                        onTap: () {
                          context.read<MessageBloc>().add(ContactMessageEvent(
                              contact: state.contacts[index]));
                          Navigator.pushNamed(context, "/messages",
                              arguments: state.contacts[index]);
                        },
                        subtitle: Text(
                            state.contacts[index].lastMessage.isNotEmpty
                                ? state.contacts[index].lastMessage.length > 10
                                    ? state.contacts[index].lastMessage
                                            .substring(0, 10) +
                                        "..."
                                    : state.contacts[index].lastMessage
                                : "",
                            softWrap: true),
                        trailing:
                            Text("Groupe : " + state.contacts[index].group),
                      ),
                    );
                  });
            }
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            ));
          })),
        ],
      ),
    );
  }
}
