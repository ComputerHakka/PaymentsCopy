import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/core/constants/constants.dart';
import 'package:personal_payment_app/features/transactions/domain/entities/transaction.dart';

class TransactionsListScreen extends StatefulWidget {
  const TransactionsListScreen({super.key});

  @override
  State<TransactionsListScreen> createState() => _TransactionsListScreenState();
}

class _TransactionsListScreenState extends State<TransactionsListScreen> {
  bool isExpand = false;

  final ScrollController _scrollController = ScrollController();

  // void _onScrollEvent() {
  //   if (_scrollController.position.userScrollDirection ==
  //       ScrollDirection.reverse) {
  //     setState(() {
  //       isExpand = false;
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   _scrollController.addListener(_onScrollEvent);
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _scrollController.removeListener(_onScrollEvent);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Операции'),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(containersColor),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Periodwidget(isExpanded: isExpand),
          Expanded(
            child: TransationsListWidget(scrollController: _scrollController),
          ),
        ],
      ),
    );
  }
}

class Periodwidget extends StatelessWidget {
  const Periodwidget({super.key, required this.isExpanded});
  final bool isExpanded;
  @override
  Widget build(BuildContext context) {
    var categories = TransactionEntity.calculateByCategory();
    List<PieChartSectionData> pies = [];
    List<CategoryChipWidget> chips = [];
    for (var c in categories.entries) {
      final color =
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
      pies.add(PieChartSectionData(
          value: c.value, radius: 20, showTitle: false, color: color));
      chips.add(CategoryChipWidget(
        label: '${c.key} ${c.value.toInt()}р',
        color: color,
      ));
    }

    return ExpansionTile(
      title: const Text('Расходы за май'),
      initiallyExpanded: isExpanded,
      children: [
        //CircleAvatar(radius: 57.5),
        SizedBox(
          height: 115,
          width: 115,
          child: PieChart(
            PieChartData(
              centerSpaceRadius: 37.5,
              sections: pies,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 10,
          children: chips,
        ),
      ],
    );
  }
}

class CategoryChipWidget extends StatelessWidget {
  const CategoryChipWidget(
      {super.key, required this.label, required this.color});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
          color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
        ),
      ),
      color: WidgetStatePropertyAll(color),
    );
  }
}

class TransationsListWidget extends StatelessWidget {
  const TransationsListWidget({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    //TODO этот кринж тоже фиксануть
    //final transactions = TransactionEntity.arrayOfTransactions;
    Set<DateTime> uniqueDays = TransactionEntity.arrayOfTransactions
        .map((transaction) => DateTime(transaction.date.year,
            transaction.date.month, transaction.date.day))
        .toSet();
    List<DateTime> uniqueDaysList = uniqueDays.toList()
      ..sort((a, b) => b.compareTo(a));

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 15),
      itemCount: uniqueDaysList.length,
      controller: scrollController,
      itemBuilder: (BuildContext context, int index) {
        return DayTransationsWidget(date: uniqueDaysList[index]);
      },
    );
  }
}

class DayTransationsWidget extends StatelessWidget {
  const DayTransationsWidget({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting(); //TODO Тоже хуйня переделываем
    var transactionsByPeriod = TransactionEntity.arrayOfTransactions
        .where((element) =>
            element.date.day == date.day && date.month == element.date.month)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            DateFormat.MMMMd('ru').format(date),
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: transactionsByPeriod.length,
          itemBuilder: (BuildContext context, int index) {
            return TransationWidget(
              transaction: transactionsByPeriod[index],
            );
          },
        ),
      ],
    );
  }
}

class TransationWidget extends StatelessWidget {
  const TransationWidget({super.key, required this.transaction});
  final TransactionEntity transaction;
  @override
  Widget build(BuildContext context) {
    final Color textColor =
        transaction.type == TransactionType.refil ? Colors.green : Colors.black;
    final String prefix = transaction.type == TransactionType.refil
        ? '+'
        : '-'; //TODO Тоже хуйня переделываем
    return Ink(
      child: InkWell(
        onTap: () {
          GoRouter.of(context).pushNamed(
            RouteNames.transactionDetailsScreen,
            extra: transaction,
          );
        },
        child: ListTile(
          leading: const CircleAvatar(
            backgroundColor: unselectedItemColor,
          ),
          title: Text(
            transaction.name,
            overflow: TextOverflow.fade,
            softWrap: false,
            maxLines: 1,
          ),
          subtitle: const Text(
            'Банковские платежи',
            style: TextStyle(fontSize: 11),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$prefix${transaction.sum.toString()}',
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Text(
                'Платежынй счет',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
