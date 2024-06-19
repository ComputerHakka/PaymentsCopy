import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_payment_app/core/constants/constants.dart';

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
              SvgPicture.asset('lib/core/assets/images/logo.svg'),
              const SizedBox(height: 80),
              Text(
                'Добро пожаловать\nв оплату услуг!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context)
                      .pushNamed(RouteNames.authorizationScreen);
                },
                child: const Text(
                  'Войти в аккаунт',
                ),
              ),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).goNamed(RouteNames.registrationScreen);
                },
                child: const Text('Создать аккаунт'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
