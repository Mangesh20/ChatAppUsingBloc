part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class FetchInitialMessagesEvent extends ChatEvent {}

class SendChatMessageEvent extends ChatEvent {
  const SendChatMessageEvent({required this.message, required this.sender, required this.receiver});
  final String message;
  final String sender;
  final String receiver;
}
