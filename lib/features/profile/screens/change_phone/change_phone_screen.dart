import 'package:flutter/material.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';

class ChangePhoneScreen extends StatelessWidget {
  const ChangePhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Укажите новый номер',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),
            TextField(
              style: const TextStyle(fontSize: 16),
              decoration: getChangeInputDecoration(),
            ),
          ],
        ),
      ),
    );
  }
}
