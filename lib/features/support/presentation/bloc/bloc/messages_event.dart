part of 'messages_bloc.dart';

sealed class MessagesEvent extends Equatable {
  final MessageEntity? message;
  const MessagesEvent({this.message});

  @override
  List<Object?> get props => [message];
}

class GetMessagesEvent extends MessagesEvent {
  const GetMessagesEvent();
}

class SendMessageEvent extends MessagesEvent {
  const SendMessageEvent({required super.message});
}
