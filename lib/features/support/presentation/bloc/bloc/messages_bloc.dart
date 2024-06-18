import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:personal_payment_app/features/support/domain/entities/message.dart';

part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  MessagesBloc() : super(const MessagesLoadingState()) {
    on<SendMessageEvent>(onSendMessageEvent);
    on<GetMessagesEvent>(onGetMessages);
  }

  void onGetMessages(GetMessagesEvent event, Emitter<MessagesState> emit) {
    emit(MessageSendDoneState(sessionMessages: MessageEntity.messagesMock));
  }

  void onSendMessageEvent(SendMessageEvent event, Emitter<MessagesState> emit) {
    MessageEntity.messagesMock.add(event.message!);
    final messages = MessageEntity.messagesMock;
    emit(MessageSendDoneState(sessionMessages: messages));
  }
}
