import 'package:chat_app_demo/chat_window/ui_layer/pages/chat_page.dart';
import 'package:flutter/material.dart';

class ChatWindow extends StatelessWidget {
  const ChatWindow({super.key, required this.receiver});
  final String receiver;
  static Route<void> route(String receiver) {
    return MaterialPageRoute<void>(
        builder: (_) =>  ChatWindow(receiver: receiver));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ChatPage(
          receiver: receiver,
        ),
      ),
    );
  }
}
