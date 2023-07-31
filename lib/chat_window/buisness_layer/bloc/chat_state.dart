part of 'chat_bloc.dart';

final class ChatState extends Equatable {
  const ChatState({required this.dateTime, this.userName = '', this.chatMessages = const []});

  final List<ChatMessage> chatMessages;
  final DateTime dateTime;
  final String userName;

  ChatState copyWith({
    DateTime? dateTime,
    String? userName,
    List<ChatMessage>? chatMessages,
  }) {
    return ChatState(
      dateTime: DateTime.now(),
      userName: userName ?? this.userName,
      chatMessages: chatMessages ?? this.chatMessages,
    );
  }

  @override
  List<Object> get props => [chatMessages, userName, dateTime];
}
