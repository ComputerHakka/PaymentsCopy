import 'package:equatable/equatable.dart';

enum TransactionType { refil, debit, iot }

class TransactionEntity extends Equatable {
  final int? id;
  final String name;
  final DateTime date;
  final double sum;
  final TransactionType type;
  final int? userId;
  final int? checkId;

  const TransactionEntity(
      {this.id,
      required this.name,
      required this.date,
      required this.sum,
      required this.type,
      this.userId,
      this.checkId});

  @override
  List<Object?> get props => [id, name, date, sum, type, userId, checkId];

  static final arrayOfTransactions = <TransactionEntity>[
    TransactionEntity(
      name: 'Коммунальные услуги для вашего дома',
      date: DateTime.utc(2024, 5, 19, 12, 15),
      sum: 14500.2,
      type: TransactionType.debit,
    ),
    TransactionEntity(
      name: 'Оплата интернета',
      date: DateTime.utc(2024, 5, 19, 10, 0),
      sum: 2000.0,
      type: TransactionType.debit,
    ),
    TransactionEntity(
      name: 'Пополнение счета',
      date: DateTime.utc(2024, 5, 19, 14, 30),
      sum: 5000.0,
      type: TransactionType.refil,
    ),
    TransactionEntity(
      name: 'Покупка продуктов',
      date: DateTime.utc(2024, 5, 19, 16, 45),
      sum: 3000.5,
      type: TransactionType.debit,
    ),
    TransactionEntity(
      name: 'Оплата мобильной связи',
      date: DateTime.utc(2024, 5, 20, 9, 15),
      sum: 1000.0,
      type: TransactionType.debit,
    ),
    TransactionEntity(
      name: 'Пополнение счета',
      date: DateTime.utc(2024, 5, 20, 12, 0),
      sum: 7500.0,
      type: TransactionType.refil,
    ),
    TransactionEntity(
      name: 'Покупка одежды',
      date: DateTime.utc(2024, 5, 25, 17, 30),
      sum: 4500.75,
      type: TransactionType.debit,
    ),
    TransactionEntity(
      name: 'Пополнение счета',
      date: DateTime.utc(2024, 5, 26, 11, 45),
      sum: 6500.0,
      type: TransactionType.refil,
    ),
    TransactionEntity(
      name: 'Оплата за проезд',
      date: DateTime.utc(2024, 5, 26, 8, 0),
      sum: 500.0,
      type: TransactionType.debit,
    ),
    TransactionEntity(
      name: 'Пополнение счета',
      date: DateTime.utc(2024, 5, 26, 10, 15),
      sum: 7000.0,
      type: TransactionType.refil,
    ),
    TransactionEntity(
      name: 'Покупка электроники',
      date: DateTime.utc(2024, 5, 26, 15, 30),
      sum: 10000.0,
      type: TransactionType.debit,
    ),
    TransactionEntity(
      name: 'Пополнение счета',
      date: DateTime.utc(2024, 5, 26, 13, 0),
      sum: 8000.0,
      type: TransactionType.refil,
    ),
    TransactionEntity(
      name: 'Оплата за аренду жилья',
      date: DateTime.utc(2024, 5, 30, 9, 0),
      sum: 25000.0,
      type: TransactionType.debit,
    ),
    TransactionEntity(
      name: 'Пополнение счета',
      date: DateTime.utc(2024, 5, 30, 12, 30),
      sum: 5500.0,
      type: TransactionType.refil,
    ),
    TransactionEntity(
      name: 'Оплата учебы',
      date: DateTime.utc(2024, 5, 30, 14, 45),
      sum: 12000.0,
      type: TransactionType.debit,
    ),
    TransactionEntity(
      name: 'Пополнение счета',
      date: DateTime.utc(2024, 5, 30, 10, 15),
      sum: 9000.0,
      type: TransactionType.refil,
    ),
    TransactionEntity(
      name: 'Покупка подарков',
      date: DateTime.utc(2024, 5, 28, 16, 0),
      sum: 3500.0,
      type: TransactionType.debit,
    ),
    TransactionEntity(
      name: 'Пополнение счета',
      date: DateTime.utc(2024, 5, 28, 11, 30),
      sum: 7000.0,
      type: TransactionType.refil,
    ),
    TransactionEntity(
      name: 'Оплата коммунальных услуг',
      date: DateTime.utc(2024, 5, 28, 8, 45),
      sum: 15000.0,
      type: TransactionType.debit,
    ),
    TransactionEntity(
      name: 'Пополнение счета',
      date: DateTime.utc(2024, 5, 28, 12, 0),
      sum: 6000.0,
      type: TransactionType.refil,
    ),
    TransactionEntity(
      name: 'Оплата за спортзал',
      date: DateTime.utc(2024, 5, 29, 9, 15),
      sum: 2000.0,
      type: TransactionType.debit,
    ),
    TransactionEntity(
      name: 'Пополнение счета',
      date: DateTime.utc(2024, 5, 18, 14, 30),
      sum: 6500.0,
      type: TransactionType.refil,
    ),
    TransactionEntity(
      name: 'Оплата медицинских услуг',
      date: DateTime.utc(2024, 5, 19, 10, 0),
      sum: 5000.0,
      type: TransactionType.debit,
    ),
    TransactionEntity(
      name: 'Пополнение счета',
      date: DateTime.utc(2024, 5, 21, 13, 45),
      sum: 7500.0,
      type: TransactionType.refil,
    ),
  ];
}
