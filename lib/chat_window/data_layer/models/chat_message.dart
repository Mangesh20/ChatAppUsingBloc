import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable {
  const ChatMessage({
    required this.sender,
    required this.receiver,
    required this.message,
    required this.dateTime,
  });


  final String sender;
  final String receiver;
  final String message;
  final DateTime dateTime;

  @override
  List<Object> get props => [sender, receiver, message, dateTime];
}
