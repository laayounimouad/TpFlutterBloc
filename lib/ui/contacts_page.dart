import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/contact/contact_bloc.dart';
import 'package:flutterbloc/bloc/contact/contact_event.dart';
import 'package:flutterbloc/bloc/contact/contact_state.dart';

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
              ElevatedButton(
                  onPressed: () {
                    context.read<ContactBloc>().add(LoadAllContactsEvent());
                  },
                  child: Text("All")),
              ElevatedButton(
                  onPressed: () {
                    context.read<ContactBloc>().add(LoadBDCContactsEvent());
                  },
                  child: Text("BDCC")),
              ElevatedButton(
                  onPressed: () {
                    context.read<ContactBloc>().add(LoadGLSIDContactsEvent());
                  },
                  child: Text("GLSID"))
            ],
          ),
          Expanded(child:
              BlocBuilder<ContactBloc, ContactState>(builder: (context, state) {
            if (state.requestState == RequestState.Loading) {
              return CircularProgressIndicator();
            } else if (state.requestState == RequestState.Loaded) {
              return ListView.builder(
                  itemCount: state.contacts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.contacts[index].name),
                    );
                  });
            } else
              return CircularProgressIndicator();
          })),
        ],
      ),
    );
  }
}
