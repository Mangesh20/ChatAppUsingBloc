import 'package:chat_app_demo/chat_window/buisness_layer/bloc/chat_bloc.dart';
import 'package:chat_app_demo/chat_window/data_layer/models/chat_message.dart';
import 'package:chat_app_demo/login/buisness_layer/authentication_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key, required this.receiver}) : super(key: key);
  final String receiver;
  final TextEditingController _textController = TextEditingController();

  List<ChatMessage> getFilteredList(BuildContext context) {
    final chatMessags = context.read<ChatBloc>().state.chatMessages;
    final user = context.read<AuthenticationBloc>().state.user;
    return chatMessags.where((element) {
      final case1 = (element.sender == user.emailAddress) && (element.receiver == receiver);
      final case2 = (element.sender == receiver) && (element.receiver == user.emailAddress);
      return case1 || case2;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: BlocBuilder<ChatBloc, ChatState>(
            buildWhen: (previous, current) {
              return previous != current;
            },
            builder: (context, state) {
              context.read<ChatBloc>().add(FetchInitialMessagesEvent());

              return BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  return ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      reverse: true,
                      itemCount: getFilteredList(context).length,
                      itemBuilder: (_, int index) {
                        final chatMessagesFiltered = getFilteredList(context);
                        return _buildMessageItem(chatMessagesFiltered.reversed.toList()[index]);
                      });
                },
              );
            },
          ),
        ),
        const Divider(height: 1.0),
        Container(
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(context),
        ),
      ],
    );
  }

  Widget _buildMessageItem(ChatMessage message) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: message.sender == receiver ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              Material(
                borderRadius: BorderRadius.circular(10.0),
                color: message.sender == state.user.emailAddress ? Colors.green[200] : Colors.blue[200],
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Text(message.message),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTextComposer(BuildContext context) {
    return IconTheme(
      data: const IconThemeData(color: Colors.blueAccent),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            return Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: _textController,
                    onSubmitted: (value) {
                      context.read<ChatBloc>().add(SendChatMessageEvent(
                            message: value,
                            sender: state.user.emailAddress,
                            receiver: receiver,
                          ));
                      _textController.clear();
                    },
                    decoration: const InputDecoration.collapsed(hintText: "Send a message"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      context.read<ChatBloc>().add(SendChatMessageEvent(
                            message: _textController.text,
                            sender: state.user.emailAddress,
                            receiver: receiver,
                          ));
                      _textController.clear();
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
