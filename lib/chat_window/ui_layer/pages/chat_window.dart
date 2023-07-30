import 'package:chat_app_demo/chat_window/buisness_layer/bloc/chat_bloc.dart';
import 'package:chat_app_demo/chat_window/data_layer/repositories/chat_records_repositry.dart';
import 'package:chat_app_demo/chat_window/ui_layer/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatWindow extends StatelessWidget {
 ChatWindow({super.key});
  final ChatRecordRepository _chatRecordRepository = ChatRecordRepository();

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) =>  ChatWindow());
  }


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider<ChatBloc>(
          create: (_) {
            final chatBloc =  ChatBloc(chatRecordRepository: _chatRecordRepository);
            chatBloc.add(FetchInitialMessagesEvent());
            return chatBloc;
          },
          child:  ChatPage(),
        ),
      ),
    );
  }
}
