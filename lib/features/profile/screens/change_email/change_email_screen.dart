import 'package:flutter/material.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';

class ChangeEmailScreen extends StatelessWidget {
  const ChangeEmailScreen({super.key});

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
            Text(
              'Изменить e-mail',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 15),
            const Text(
              'На e-mail приходят выписки, счета и справки',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: unselectedItemColor,
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              style: const TextStyle(fontSize: 16),
              decoration: getChangeInputDecoration().copyWith(
                  hintText: 'Введите ваш e-mail',
                  hintStyle: const TextStyle(
                    color: unselectedItemColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
