import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/contact/contact_state.dart';
import 'package:flutterbloc/bloc/message/message.bloc.dart';
import 'package:flutterbloc/bloc/message/message.state.dart';
import 'package:flutterbloc/model/contact_model.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Contact contact = ModalRoute.of(context)!.settings.arguments as Contact;

    return Scaffold(
      appBar: AppBar(title: const Text("Messages")),
      body: Center(
        child:
            BlocBuilder<MessageBloc, MessageState>(builder: (context, state) {
          if (state.requestState == RequestState.Loading) {
            return const CircularProgressIndicator();
          } else if (state.requestState == RequestState.Loaded) {
            return Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 7.0, bottom: 7.0),
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: state.messages.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    top: 8.0,
                                    bottom: 8.0,
                                    left:
                                        state.messages[index].sent ? 50.0 : 0.0,
                                    right: state.messages[index].sent
                                        ? 0.0
                                        : 50.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: (state.messages[index].sent
                                        ? Colors.grey.shade200
                                        : Colors.blue[200]),
                                  ),
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    state.messages[index].content,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                                /*ListTile(
                                  tileColor: state.messages[index].sent
                                      ? Colors.blue
                                      : Colors.red,
                                  minVerticalPadding: 20,
                                  title: Text(state.messages[index].content),
                                ),*/
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          bottom: 20,
                          top: 10,
                        ),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.mic,
                              color: Color.fromARGB(255, 0, 127, 232),
                            )),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                            bottom: 20,
                            top: 10,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              const Expanded(
                                  child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Type message',
                                    border: InputBorder.none),
                              )),
                              InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.send,
                                    color: Color.fromARGB(255, 0, 127, 232),
                                    size: 20,
                                  )),
                              const SizedBox(
                                width: 13,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          ));
        }),
      ),
    );
  }
}
