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

  static var notificationsMock = <MessageEntity>[
    MessageEntity(
      text:
          'Внесите 1299р. 04.06.2024 приостановка услуг по договору 518128491easaSDa',
      userId: 3,
      date: DateTime(2024, 5, 19, 10, 15),
    ),
    MessageEntity(
      text:
          'Внесите 1299р. 04.06.2024 приостановка услуг по договору 518128491easaSDa',
      userId: 3,
      date: DateTime(2024, 5, 19, 10, 15),
    ),
    MessageEntity(
      text:
          'Внесите 1299р. 04.06.2024 приостановка услуг по договору 518128491easaSDa',
      userId: 3,
      date: DateTime(2024, 5, 20, 10, 15),
    ),
    MessageEntity(
      text:
          'Внесите 1299р. 04.06.2024 приостановка услуг по договору 518128491easaSDa',
      userId: 3,
      date: DateTime(2024, 5, 25, 10, 15),
    ),
    MessageEntity(
      text:
          'Внесите 1299р. 04.06.2024 приостановка услуг по договору 518128491easaSDa',
      userId: 3,
      date: DateTime(2024, 5, 25, 10, 15),
    ),
    MessageEntity(
      text:
          'Внесите 1299р. 04.06.2024 приостановка услуг по договору 518128491easaSDa',
      userId: 3,
      date: DateTime(2024, 5, 30, 10, 15),
    ),
  ];
}
