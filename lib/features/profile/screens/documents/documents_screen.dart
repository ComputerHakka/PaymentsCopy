import 'package:flutter/material.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';

class UserDocumentsScreen extends StatelessWidget {
  const UserDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Документы'),
        centerTitle: false,
      ),
      body: const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            ContratsListWidget(title: 'Договоры'),
            SizedBox(height: 17),
            ContratsListWidget(title: 'Удостоверения личности'),
          ],
        ),
      ),
    );
  }
}

class ContratsListWidget extends StatelessWidget {
  const ContratsListWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(title),
        ),
        SizedBox(
          height: 137,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
            children: const [
              DocumentCellWidget(),
              DocumentCellWidget(),
              DocumentCellWidget(),
            ],
          ),
        ),
      ],
    );
  }
}

class DocumentCellWidget extends StatelessWidget {
  const DocumentCellWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: containersColor,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(15),
      //width: 118,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 17.5),
          SizedBox(height: 11),
          Text(
            'Алексей Иванов',
            style: TextStyle(fontSize: 10),
          ),
          Text(
            'Купли-продажа',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
