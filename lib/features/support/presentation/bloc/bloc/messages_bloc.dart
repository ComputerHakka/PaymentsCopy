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
    final messages = MessageEntity.messagesMock.toList();
    emit(MessageSendDoneState(sessionMessages: messages));
  }

  void onSendMessageEvent(SendMessageEvent event, Emitter<MessagesState> emit) {
    if (event.message!.text.isEmpty) {
      return;
    }
    final state = this.state;
    emit(
      MessageSendDoneState(
        sessionMessages: List.from(state.sessionMessages!)..add(event.message!),
      ),
    );
  }
}
