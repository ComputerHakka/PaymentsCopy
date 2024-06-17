import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/core/constants/constants.dart';

class TransactionsListScreen extends StatelessWidget {
  const TransactionsListScreen({super.key});

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
    return ExpansionTile(
      title: const Text('Расходы за май'),
      children: [
        //CircleAvatar(radius: 57.5),
        SizedBox(
          height: 115,
          width: 115,
          child: PieChart(
            PieChartData(
              centerSpaceRadius: 37.5,
              sections: [
                PieChartSectionData(value: 30, radius: 20, showTitle: false),
                PieChartSectionData(value: 10, radius: 20, showTitle: false),
                PieChartSectionData(value: 20, radius: 20, showTitle: false),
                PieChartSectionData(value: 50, radius: 20, showTitle: false),
                PieChartSectionData(value: 40, radius: 20, showTitle: false),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
        const Wrap(
          spacing: 10,
          children: [
            CategoryChipWidget(label: 'Интернет 1000р'),
            CategoryChipWidget(label: 'ЖКХ 1000р'),
            CategoryChipWidget(label: 'Охрана 1000р'),
            CategoryChipWidget(label: 'Чистая вода 1000р'),
            CategoryChipWidget(label: 'Остальное 1000р'),
          ],
        ),
      ],
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
      color: const WidgetStatePropertyAll(Colors.amberAccent),
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
    return Ink(
      child: InkWell(
        onTap: () {
          GoRouter.of(context).pushNamed(RouteNames.transactionDetailsScreen);
        },
        child: const ListTile(
          leading: CircleAvatar(
            backgroundColor: unselectedItemColor,
          ),
          title: Text(
            'Коммунальные услуги для вашего дома',
            overflow: TextOverflow.fade,
            softWrap: false,
            maxLines: 1,
            style: TextStyle(fontSize: 17),
          ),
          subtitle: Text('Банковские платежи', style: TextStyle(fontSize: 11)),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('+14500,2',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
              Text('Платежынй счет',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ),
    );
  }
}
