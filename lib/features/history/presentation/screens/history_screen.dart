import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/features/transactions/domain/entities/transaction.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTextField(),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: containersColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //TODO Пиздец сомнительная тема
          GestureDetector(
            onTap: () async {
              final DateTimeRange? dateTimeRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(3000),
                initialEntryMode: DatePickerEntryMode.calendarOnly,
              );
              if (dateTimeRange != null) {}
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 15, 16, 10),
              child: Text('Май',
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              scrollDirection: Axis.horizontal,
              children: const [
                CategoryChip(label: 'Все', isChecked: true),
                CategoryChip(label: 'Траты', isChecked: false),
                CategoryChip(label: 'Пополнения', isChecked: false),
                CategoryChip(label: 'Открытие дверей', isChecked: false),
              ],
            ),
          ),
          const Expanded(
            child: TransationsListWidget(),
          ),
        ],
      ),
    );
  }
}

class CategoryChip extends StatefulWidget {
  const CategoryChip({
    super.key,
    required this.label,
    required this.isChecked,
  });
  final String label;
  final bool isChecked;

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  late bool isChecked;
  @override
  void initState() {
    isChecked = widget.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ChoiceChip(
        showCheckmark: false,
        label: Text(
          widget.label,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: !isChecked ? Colors.black : Colors.white,
              ),
        ),
        selected: isChecked,
        onSelected: (value) {
          setState(() {
            isChecked = !isChecked;
          });
        },
      ),
    );
  }
}

//TODO убрать дублирование виджетов нижу также из страницы transactions_screen

class TransationsListWidget extends StatelessWidget {
  const TransationsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO этот кринж тоже фиксануть
    //final transactions = TransactionEntity.arrayOfTransactions;
    Set<DateTime> uniqueDays = TransactionEntity.arrayOfTransactions
        .map((transaction) => DateTime(transaction.date.year,
            transaction.date.month, transaction.date.day))
        .toSet();
    List<DateTime> uniqueDaysList = uniqueDays.toList()
      ..sort((a, b) => a.compareTo(b));

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 15),
      itemCount: uniqueDaysList.length,
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
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: unselectedItemColor,
      ),
      title: Text(
        transaction.name,
        overflow: TextOverflow.fade,
        softWrap: false,
        maxLines: 1,
      ),
      subtitle: const Text('Банковские платежи'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '$prefix${transaction.sum.toString()}',
            style: TextStyle(color: textColor),
          ),
          const Text('Платежынй счет'),
        ],
      ),
    );
  }
}

class AppBarTextField extends StatelessWidget {
  const AppBarTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        hintText: 'Поиск',
        hintStyle: const TextStyle(color: unselectedItemColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: containersColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
    );
  }
}


// class DatePickerRangeWidget extends StatelessWidget {
//   const DatePickerRangeWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () async {
//           final DateTimeRange? dateTimeRange = await showDateRangePicker(
//             context: context,
//             firstDate: DateTime(2000),
//             lastDate: DateTime(3000),
//             initialEntryMode: DatePickerEntryMode.calendarOnly,
//           );
//           if (dateTimeRange != null) {}
//         },
//         child: const Text('Показать ад'),
//       ),
//     );
//   }
// }
