import 'package:bloc/bloc.dart';
import 'package:chat_app_demo/chat_window/data_layer/models/chat_message.dart';
import 'package:chat_app_demo/chat_window/data_layer/repositories/chat_records_repositry.dart';
import 'package:equatable/equatable.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({
    required ChatRecordRepository chatRecordRepository,
  })  : _chatRecordRepository = chatRecordRepository,
        super(ChatState(dateTime: DateTime.now())) {
    on<FetchInitialMessagesEvent>(_onFetchInitialMessage);
    on<SendChatMessageEvent>(_onSendMessage);
  }

  final ChatRecordRepository _chatRecordRepository;

  void _onFetchInitialMessage(FetchInitialMessagesEvent event, Emitter<ChatState> emit) async {
    final messages = await _chatRecordRepository.getInitialMessages();
    return emit(state.copyWith(chatMessages: messages));
  }

  void _onSendMessage(SendChatMessageEvent event, Emitter<ChatState> emit) async {
    final messages = await _chatRecordRepository.sendMessage(sender: event.sender, receiver: event.receiver, message: event.message);
    return emit(state.copyWith(chatMessages: messages));
  }
}
