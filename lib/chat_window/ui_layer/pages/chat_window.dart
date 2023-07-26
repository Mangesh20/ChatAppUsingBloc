import 'package:chat_app_demo/chat_window/buisness_layer/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatWindow extends StatelessWidget {
  const ChatWindow({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ChatWindow());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider<ChatBloc>(
          create: (_) {
            return ChatBloc();
          },
          child: const Text("Chat"),
        ),
      ),
    );
  }
}
