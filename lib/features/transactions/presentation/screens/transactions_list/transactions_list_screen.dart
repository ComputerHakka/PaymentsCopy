import 'package:flutter/material.dart';

class TransactionsListScreen extends StatelessWidget {
  const TransactionsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [
          Periodwidget(),
          Expanded(
            child: TransationsListWidget(),
          ),
        ],
      ),
    );
  }
}

class Periodwidget extends StatelessWidget {
  const Periodwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: const ExpansionTile(
        title: Text('Расходы за май'),
        children: [
          CircleAvatar(radius: 57.5),
          Wrap(
            spacing: 10,
            children: [
              CategoryChipWidget(label: 'Интернет 1000₽'),
              CategoryChipWidget(label: 'ЖКХ 1000₽'),
              CategoryChipWidget(label: 'Охрана 1000₽'),
              CategoryChipWidget(label: 'Чистая вода 1000₽'),
              CategoryChipWidget(label: 'Остальное 1000₽'),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryChipWidget extends StatelessWidget {
  const CategoryChipWidget({super.key, required this.label});
  final String label;

  //TODO chip theme from app theme
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      side: const BorderSide(color: Colors.transparent),
      shape: const StadiumBorder(),
      color: const MaterialStatePropertyAll(Colors.green),
    );
  }
}

class TransationsListWidget extends StatelessWidget {
  const TransationsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 15),
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return const DayTransationsWidget();
      },
    );
  }
}

class DayTransationsWidget extends StatelessWidget {
  const DayTransationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '19 Мая',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return const TransationWidget();
          },
        ),
      ],
    );
  }
}

class TransationWidget extends StatelessWidget {
  const TransationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.cyan,
      ),
      title: Text(
        'Коммунальные услуги для вашего дома',
        overflow: TextOverflow.fade,
        softWrap: false,
        maxLines: 1,
      ),
      subtitle: Text('Банковские платежи'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('+14500,2'),
          Text('Платежынй счет'),
        ],
      ),
    );
  }
}
