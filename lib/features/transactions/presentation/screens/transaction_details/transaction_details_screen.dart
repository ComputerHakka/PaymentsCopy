import 'package:flutter/material.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';

class TransactionDetailsScreen extends StatelessWidget {
  const TransactionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 3),
        child: AppBar(
          title: const Text('11 мая 2024'),
          centerTitle: false,
          flexibleSpace: Container(
            padding: EdgeInsets.all(16.0),
            color: containersColor,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 33.5,
                ),
                SizedBox(
                  height: 15,
                ),
                Text('Коммунальные услуги для вашего дома ЖКХ'),
                Text('Коммунальные платежы'),
                Text('-14 500,2 ₽'),
              ],
            ),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Оплата со счета'),
            Text('Документы'),
          ],
        ),
      ),
    );
  }
}
