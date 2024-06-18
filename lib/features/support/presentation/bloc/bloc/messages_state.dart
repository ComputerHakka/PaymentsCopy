part of 'messages_bloc.dart';

sealed class MessagesState extends Equatable {
  const MessagesState({this.sessionMessages});
  final List<MessageEntity>? sessionMessages;

  @override
  List<Object?> get props => [sessionMessages];
}

final class MessagesLoadingState extends MessagesState {
  const MessagesLoadingState();
}

final class MessageSendDoneState extends MessagesState {
  const MessageSendDoneState({super.sessionMessages});
}
