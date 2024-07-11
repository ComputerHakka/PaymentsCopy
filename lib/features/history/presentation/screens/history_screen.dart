import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/core/constants/constants.dart';
import 'package:personal_payment_app/features/history/presentation/bloc/filter/filter_transactions_bloc.dart';
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
              icon: SvgPicture.asset(
                'lib/core/assets/icons/notifications.svg',
              ),
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
                locale: const Locale('ru'),
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
          BlocBuilder<FilterTransactionsBloc, FilterTransactionsState>(
            builder: (context, state) {
              if (state is FilterTransactionsLoadingState) {
                return FiltersListWidget(filters: state.filters);
              }
              if (state is FilterTransactionsFilterState) {
                return FiltersListWidget(filters: state.filters);
              } else {
                return const FiltersListWidget(
                  filters: [false, false, false, false],
                );
              }
            },
          ),
          Expanded(
            child: BlocBuilder<FilterTransactionsBloc, FilterTransactionsState>(
              builder: (context, state) {
                if (state is FilterTransactionsFilterState) {
                  return TransationsListWidget(
                      daysList: state.dates!,
                      transactions: state.transactions!);
                }
                if (state is FilterTransactionsLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const Center(child: Text('Что-то пошло не так'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FiltersListWidget extends StatelessWidget {
  const FiltersListWidget({
    super.key,
    required this.filters,
  });

  final List<bool> filters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        scrollDirection: Axis.horizontal,
        children: [
          CategoryChip(label: 'Все', index: 0, isChecked: filters[0]),
          CategoryChip(label: 'Траты', index: 1, isChecked: filters[1]),
          CategoryChip(label: 'Пополнения', index: 2, isChecked: filters[2]),
          CategoryChip(
              label: 'Открытие дверей', index: 3, isChecked: filters[3]),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.label,
    required this.isChecked,
    required this.index,
  });
  final String label;
  final bool isChecked;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ChoiceChip(
        showCheckmark: false,
        label: Text(
          label,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: !isChecked ? Colors.black : Colors.white,
              ),
        ),
        selected: isChecked,
        onSelected: (value) {
          BlocProvider.of<FilterTransactionsBloc>(context)
              .add(ChangeFilterEvent(index: index));
        },
      ),
    );
  }
}

//TODO убрать дублирование виджетов нижу также из страницы transactions_screen

class TransationsListWidget extends StatelessWidget {
  const TransationsListWidget(
      {super.key, required this.daysList, required this.transactions});

  final List<DateTime> daysList;
  final List<TransactionEntity> transactions;

  @override
  Widget build(BuildContext context) {
    if (transactions.isNotEmpty) {
      return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemCount: daysList.length,
        itemBuilder: (BuildContext context, int index) {
          return DayTransationsWidget(
            date: daysList[index],
            transactions: transactions,
          );
        },
      );
    } else {
      return const Center(
        child: Text(
          'За выбранный период операций\nне обнаружено',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}

class DayTransationsWidget extends StatelessWidget {
  const DayTransationsWidget(
      {super.key, required this.date, required this.transactions});

  final DateTime date;
  final List<TransactionEntity> transactions;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting(); //TODO Тоже хуйня переделываем
    var transactionsByPeriod = transactions
        .where((element) =>
            element.date.day == date.day && date.month == element.date.month)
        .toList();

    if (transactionsByPeriod.isEmpty) {
      return const SizedBox();
    } else {
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
      onTap: () {
        GoRouter.of(context).pushNamed(
          RouteNames.transactionDetailsScreen,
          extra: transaction,
        );
      },
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
          borderSide: BorderSide.none,
        ),
        hintText: 'Поиск',
        hintStyle: const TextStyle(color: unselectedItemColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search, color: unselectedItemColor),
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
