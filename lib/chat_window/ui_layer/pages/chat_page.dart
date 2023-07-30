import 'package:chat_app_demo/chat_window/buisness_layer/bloc/chat_bloc.dart';
import 'package:chat_app_demo/chat_window/data_layer/models/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
        return Column(
          children: <Widget>[
            Flexible(
              child: BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    reverse: true,
                    itemCount: state.chatMessages.length,
                    itemBuilder: (_, int index) => _buildMessageItem(
                        state.chatMessages.reversed.toList()[index]),
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
      child: Row(
        mainAxisAlignment: message.userName == 'Progyny2'
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          Material(
            borderRadius: BorderRadius.circular(10.0),
            color: message.userName == 'Progyny2'
                ? Colors.green[200]
                : Colors.blue[200],
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(message.message),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer(BuildContext context) {
    return IconTheme(
      data: const IconThemeData(color: Colors.blueAccent),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: (value) {
                  context.read<ChatBloc>().add(SendChatMessageEvent(
                      message: value, userName: 'Progyny1'));
                },
                decoration:
                    const InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  context.read<ChatBloc>().add(SendChatMessageEvent(
                      message: _textController.text, userName: 'progyny1'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
