import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Войти'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Имя',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Фамилия',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Почта',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Пароль',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Пароль ещё раз',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text('Нажав принять...'),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Войти в аккаунт'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
