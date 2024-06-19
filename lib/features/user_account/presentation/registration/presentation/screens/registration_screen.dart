import 'package:flutter/material.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Регистрация',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Имя',
                  ),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Фамилия',
                  ),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Почта',
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                    'На вашу почту поступит письмо\nс подтверждением аккаунта'),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                  ),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Пароль ещё раз',
                  ),
                ),
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    text: 'Нажав «Принять и продолжить», я соглашаюсь с ',
                    style: getTextStyle(false),
                    children: [
                      TextSpan(
                          text: 'Условиями обслуживания ',
                          style: getTextStyle(true)),
                      TextSpan(
                          text: 'Оплаты услуг, ', style: getTextStyle(false)),
                      TextSpan(
                          text: 'Условиями обслуживания платежей ',
                          style: getTextStyle(true)),
                      TextSpan(text: 'и ', style: getTextStyle(false)),
                      TextSpan(
                          text: 'Политикой уведомлений',
                          style: getTextStyle(true)),
                      TextSpan(
                          text: ', а также принимаю ',
                          style: getTextStyle(false)),
                      TextSpan(
                          text: 'Политику конфиденциальности.',
                          style: getTextStyle(true)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Войти в аккаунт'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CorrectPasswordCheckotWidget extends StatelessWidget {
  const CorrectPasswordCheckotWidget(
      {super.key,
      required this.isCorrect,
      required this.isMain,
      required this.parameter});

  final bool isCorrect;
  final bool isMain;
  final String parameter;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.close_outlined),
        Text(parameter),
      ],
    );
  }
}

TextStyle getTextStyle(bool isLink) {
  return TextStyle(
    color: isLink ? accentColor : Colors.black,
    decoration: isLink ? TextDecoration.underline : TextDecoration.none,
    height: 1.4,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}
