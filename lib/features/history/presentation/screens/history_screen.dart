import 'package:flutter/material.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTextField(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Май'),
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
        //showCheckmark: false,
        label: Text(widget.label),
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
        hintStyle: const TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
    );
  }
}
