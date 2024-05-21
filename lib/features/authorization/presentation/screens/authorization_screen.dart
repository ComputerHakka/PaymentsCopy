import 'package:flutter/material.dart';

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({super.key});

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
                decoration: InputDecoration(labelText: 'Почта'),
              ),
              const SizedBox(
                height: 16,
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Пароль',
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  //errorText: '* Неверный пароль',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Забыли пароль?'),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Войти'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
