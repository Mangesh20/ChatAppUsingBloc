import 'dart:async';

import 'package:chat_app_demo/chat_window/data_layer/models/chat_message.dart';
import 'package:equatable/equatable.dart';

class ChatRecordRepository extends Equatable {
  final List<ChatMessage> _chatMessages = [
    ChatMessage(sender: 'progyny2@test.com', receiver: 'progyny1@test.com', message: 'Hi', dateTime: DateTime.now()),
    ChatMessage(sender: 'progyny1@test.com', receiver: 'progyny2@test.com', message: 'Hi', dateTime: DateTime.now()),
    ChatMessage(sender: 'progyny2@test.com', receiver: 'progyny1@test.com', message: 'How are you?', dateTime: DateTime.now()),
    ChatMessage(sender: 'progyny1@test.com', receiver: 'progyny2@test.com', message: 'I am good, how are you?', dateTime: DateTime.now()),
    ChatMessage(sender: 'progyny2@test.com', receiver: 'progyny1@test.com', message: 'Fine! What is your plan for the weekend?', dateTime: DateTime.now()),
    ChatMessage(sender: 'progyny1@test.com', receiver: 'progyny2@test.com', message: 'Nothing as such! you tell.', dateTime: DateTime.now()),
  ];

  Future<List<ChatMessage>?> getInitialMessages() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _chatMessages;
  }

  Future<List<ChatMessage>?> sendMessage({required String sender, required String receiver, required String message}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final chatMessage = ChatMessage(sender: sender, receiver: receiver, message: message, dateTime: DateTime.now());
    _chatMessages.add(chatMessage);
    return _chatMessages;
  }

  @override
  List<Object?> get props => [_chatMessages];
}
