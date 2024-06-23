import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/features/transactions/domain/entities/transaction.dart';

class TransactionDetailsScreen extends StatelessWidget {
  const TransactionDetailsScreen({super.key, required this.currentTransaction});
  final TransactionEntity currentTransaction;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    final String date = DateFormat.yMMMMd('ru').format(currentTransaction.date);
    final String dateTime = DateFormat.Hm('ru').format(currentTransaction.date);
    final String symbol =
        currentTransaction.type == TransactionType.debit ? '-' : '+';
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height / 3.3),
        child: AppBar(
          title: Text('$date, $dateTime'),
          centerTitle: false,
          flexibleSpace: Container(
            padding: const EdgeInsets.all(16.0),
            color: containersColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircleAvatar(
                  radius: 33.5,
                ),
                const SizedBox(height: 15),
                Text(currentTransaction.name),
                Text(
                  currentTransaction.category.name,
                  style: const TextStyle(
                    color: unselectedItemColor,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 5),
                Text('$symbol${currentTransaction.sum} р',
                    style: const TextStyle(fontSize: 24)),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              currentTransaction.type == TransactionType.debit
                  ? 'Оплата со счета'
                  : 'Поступление на счет',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const Text(
              'Документы',
              style: TextStyle(
                color: accentColor,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
