import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final int? id;
  final String text;
  final int userId;
  final DateTime date;

  const MessageEntity(
      {this.id, required this.text, required this.userId, required this.date});
  @override
  List<Object?> get props => [id, text, userId, date];

  static var messagesMock = <MessageEntity>[
    MessageEntity(
      text: 'Нужна помощь с транзакциями',
      userId: 1,
      date: DateTime(2024, 5, 19, 10, 15),
    ),
    MessageEntity(
      text: 'Здравствуйте! Чем могу быть полезен?',
      userId: 2,
      date: DateTime(2024, 5, 19, 10, 16),
    ),
  ];
}
