import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable {
  const ChatMessage({required this.userName, required this.message, required this.dateTime });

  final String userName;
  final String message;
  final DateTime dateTime;


  @override
  List<Object> get props => [ userName, message, dateTime];
}
