part of 'chat_bloc.dart';

class ChatState extends Equatable {
  const ChatState(
      {this.chatMessage = '',
      this.userName = '',
      this.chatMessages = const []});

  final String chatMessage;
  final String userName;
  final List<ChatMessage> chatMessages;

  ChatState copyWith({
    String? chatMessage,
    String? userName,
    List<ChatMessage>? chatMessages,
  }) {
    return ChatState(
        chatMessage: chatMessage ?? this.chatMessage,
        userName: userName ?? this.userName,
        chatMessages: chatMessages ?? this.chatMessages);
  }

    @override
  List<Object> get props => [chatMessage, userName, chatMessages];

}


