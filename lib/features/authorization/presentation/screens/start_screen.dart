import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('lib/core/assets/images/logo.png'),
              const SizedBox(height: 80),
              Text(
                'Добро пожаловать\nв оплату услуг!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Войти в аккаунт',
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Создать аккаунт'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
