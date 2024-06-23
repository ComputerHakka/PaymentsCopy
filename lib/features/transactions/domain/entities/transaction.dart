import 'package:equatable/equatable.dart';

enum TransactionType { refil, debit, iot }

class TransactionCategory {
  final String name;

  TransactionCategory(this.name);

  static var categories = <TransactionCategory>[
    TransactionCategory('Интернет'),
    TransactionCategory('ЖКХ'),
    TransactionCategory('Магазины'),
    TransactionCategory('Связь'),
    TransactionCategory('Сервисы'),
    TransactionCategory('Остальное'),
    TransactionCategory('Пополнение'),
  ];
}

class TransactionEntity extends Equatable {
  final int? id;
  final String name;
  final DateTime date;
  final double sum;
  final TransactionType type;
  final TransactionCategory category;
  final int? userId;
  final int? checkId;

  const TransactionEntity(
      {this.id,
      required this.name,
      required this.date,
      required this.sum,
      required this.type,
      required this.category,
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
      category: TransactionCategory.categories[1],
    ),
    TransactionEntity(
      name: 'Оплата интернета',
      date: DateTime.utc(2024, 5, 19, 10, 0),
      sum: 3000.0,
      type: TransactionType.debit,
      category: TransactionCategory.categories[0],
    ),
    TransactionEntity(
      name: 'Пополнение счета',
      date: DateTime.utc(2024, 5, 19, 14, 30),
      sum: 5000.0,
      type: TransactionType.refil,
      category: TransactionCategory.categories[6],
    ),
    TransactionEntity(
      name: 'Покупка продуктов',
      date: DateTime.utc(2024, 5, 19, 16, 45),
      sum: 3000.5,
      type: TransactionType.debit,
      category: TransactionCategory.categories[2],
    ),
    TransactionEntity(
      name: 'Оплата мобильной связи',
      date: DateTime.utc(2024, 5, 20, 9, 15),
      sum: 5000.0,
      type: TransactionType.debit,
      category: TransactionCategory.categories[3],
    ),
    TransactionEntity(
      name: 'Пополнение счета',
      date: DateTime.utc(2024, 5, 20, 12, 0),
      sum: 7500.0,
      type: TransactionType.refil,
      category: TransactionCategory.categories[6],
    ),
    TransactionEntity(
      name: 'Покупка одежды',
      date: DateTime.utc(2024, 5, 25, 17, 30),
      sum: 4500.75,
      type: TransactionType.debit,
      category: TransactionCategory.categories[2],
    ),
    TransactionEntity(
      name: 'Пополнение счета',
      date: DateTime.utc(2024, 5, 26, 11, 45),
      sum: 6500.0,
      type: TransactionType.refil,
      category: TransactionCategory.categories[6],
    ),
    TransactionEntity(
      name: 'Оплата за проезд',
      date: DateTime.utc(2024, 5, 26, 8, 0),
      sum: 500.0,
      type: TransactionType.debit,
      category: TransactionCategory.categories[5],
    ),
    TransactionEntity(
      name: 'Пополнение счета',
      date: DateTime.utc(2024, 5, 26, 10, 15),
      sum: 7000.0,
      type: TransactionType.refil,
      category: TransactionCategory.categories[6],
    ),
    TransactionEntity(
      name: 'Покупка электроники',
      date: DateTime.utc(2024, 5, 26, 15, 30),
      sum: 10000.0,
      type: TransactionType.debit,
      category: TransactionCategory.categories[2],
    ),
    TransactionEntity(
      name: 'Пополнение счета',
      date: DateTime.utc(2024, 5, 26, 13, 0),
      sum: 8000.0,
      type: TransactionType.refil,
      category: TransactionCategory.categories[6],
    ),
    TransactionEntity(
      name: 'Оплата за аренду жилья',
      date: DateTime.utc(2024, 5, 30, 9, 0),
      sum: 25000.0,
      type: TransactionType.debit,
      category: TransactionCategory.categories[4],
    ),
    TransactionEntity(
      name: 'Пополнение счета',
      date: DateTime.utc(2024, 5, 30, 12, 30),
      sum: 5500.0,
      type: TransactionType.refil,
      category: TransactionCategory.categories[6],
    ),
    TransactionEntity(
      name: 'Оплата учебы',
      date: DateTime.utc(2024, 5, 30, 14, 45),
      sum: 12000.0,
      type: TransactionType.debit,
      category: TransactionCategory.categories[4],
    ),
    TransactionEntity(
      name: 'Пополнение счета',
      date: DateTime.utc(2024, 5, 30, 10, 15),
      sum: 9000.0,
      type: TransactionType.refil,
      category: TransactionCategory.categories[6],
    ),
    TransactionEntity(
      name: 'Покупка подарков',
      date: DateTime.utc(2024, 5, 28, 16, 0),
      sum: 3500.0,
      type: TransactionType.debit,
      category: TransactionCategory.categories[2],
    ),
    TransactionEntity(
      name: 'Пополнение счета',
      date: DateTime.utc(2024, 5, 28, 11, 30),
      sum: 7000.0,
      type: TransactionType.refil,
      category: TransactionCategory.categories[6],
    ),
    TransactionEntity(
      name: 'Оплата коммунальных услуг',
      date: DateTime.utc(2024, 5, 28, 8, 45),
      sum: 15000.0,
      type: TransactionType.debit,
      category: TransactionCategory.categories[1],
    ),
    TransactionEntity(
      name: 'Пополнение счета',
      date: DateTime.utc(2024, 5, 28, 12, 0),
      sum: 6000.0,
      type: TransactionType.refil,
      category: TransactionCategory.categories[6],
    ),
    TransactionEntity(
      name: 'Оплата за спортзал',
      date: DateTime.utc(2024, 5, 29, 9, 15),
      sum: 2000.0,
      type: TransactionType.debit,
      category: TransactionCategory.categories[4],
    ),
    TransactionEntity(
      name: 'Пополнение счета',
      date: DateTime.utc(2024, 5, 18, 14, 30),
      sum: 6500.0,
      type: TransactionType.refil,
      category: TransactionCategory.categories[6],
    ),
    TransactionEntity(
      name: 'Оплата медицинских услуг',
      date: DateTime.utc(2024, 5, 19, 10, 0),
      sum: 5000.0,
      type: TransactionType.debit,
      category: TransactionCategory.categories[4],
    ),
    TransactionEntity(
      name: 'Пополнение счета',
      date: DateTime.utc(2024, 5, 21, 13, 45),
      sum: 7500.0,
      type: TransactionType.refil,
      category: TransactionCategory.categories[6],
    ),
  ];

  static Map<String, double> calculateByCategory() {
    var categories = arrayOfTransactions
        .where((e) => e.type == TransactionType.debit)
        .map((e) => e.category.name)
        .toSet()
        .toList();
    Map<String, double> result = {};
    for (var c in categories) {
      var transactionsByCategory =
          arrayOfTransactions.where((e) => e.category.name == c).toList();
      var categoryCost = transactionsByCategory.fold<double>(
          0, (previousValue, e) => previousValue + e.sum);

      result.addAll({c: categoryCost});
    }
    var mapEntries = result.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    result
      ..clear()
      ..addEntries(mapEntries);
    return result;
  }
}
