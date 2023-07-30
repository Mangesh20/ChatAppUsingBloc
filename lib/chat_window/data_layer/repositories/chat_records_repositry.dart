import 'dart:async';

import 'package:chat_app_demo/chat_window/data_layer/models/chat_message.dart';
import 'package:equatable/equatable.dart';

class ChatRecordRepository extends Equatable{
  List<ChatMessage>? _chatMessages;

  Future<List<ChatMessage>?> getInitialMessages() async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (_chatMessages != null) return _chatMessages;    
    _chatMessages =  [
        ChatMessage( userName: 'Progyny1', message: 'Hi', dateTime: DateTime.now()),
        ChatMessage( userName: 'Progyny2', message: 'Hi', dateTime: DateTime.now()),
        ChatMessage( userName: 'Progyny1', message: 'How are you?', dateTime: DateTime.now()),
        ChatMessage( userName: 'Progyny2', message: 'I am good, how are you?', dateTime: DateTime.now()),
        ChatMessage( userName: 'Progyny1', message: 'Fine! What is your plan for the weekend?', dateTime: DateTime.now()),
        ChatMessage( userName: 'Progyny2', message: 'Nothing as such! you tell.', dateTime: DateTime.now()),
        ];
        return _chatMessages;
  }

    Future<List<ChatMessage>?>  sendMessage({required String userName, required String message }) async {
      _chatMessages ??= [];   
      final chatMessage =  ChatMessage(userName: userName, message: message, dateTime: DateTime.now());
      _chatMessages?.add(chatMessage);
      return _chatMessages;  
    }
    
    @override
    List<Object?> get props => [_chatMessages];

}

