import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/core/constants/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Домашняя')),
        body: SizedBox(
          child: Column(
            children: [
              const UserNameWidget(),
              const AccountBalanceWidget(),
              SizedBox(
                height: 118,
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2.5, horizontal: 11),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    OptionBoxWidget(title: 'Камеры'),
                    OptionBoxWidget(title: 'Двери'),
                    OptionBoxWidget(title: 'Парковка'),
                    OptionBoxWidget(title: 'Пизда'),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 7.5, horizontal: 16),
                child: Row(
                  children: [
                    TransactionsInfoWidget(),
                    SizedBox(
                      width: 16,
                    ),
                    ServicesInfoWidget(),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 7.5, horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock_open),
                      SizedBox(width: 10),
                      Text('Открыть дверь'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UserNameWidget extends StatelessWidget {
  const UserNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7.5),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 19.5,
            child: Text('A'),
          ),
          const SizedBox(width: 19),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).goNamed(RouteNames.profileScreen);
            },
            child: const Row(
              children: [
                Text(
                  'Алексей',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(width: 10),
                Icon(Icons.arrow_forward_ios_outlined),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OptionBoxWidget extends StatelessWidget {
  const OptionBoxWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.all(14),
        width: 103,
        height: 103,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: containersColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title),
          ],
        ),
      ),
    );
  }
}

class AccountBalanceWidget extends StatelessWidget {
  const AccountBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7.5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
        height: 67,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: containersColor,
        ),
        child: const Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ваш баланс',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  '12 729,22 ₽',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text('Пополнить'),
            //   style: const ButtonStyle(
            //     padding: MaterialStatePropertyAll(
            //       EdgeInsets.symmetric(
            //         vertical: 12,
            //         horizontal: 15,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class TransactionsInfoWidget extends StatelessWidget {
  const TransactionsInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 133,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: containersColor,
        ),
      ),
    );
  }
}

class ServicesInfoWidget extends StatelessWidget {
  const ServicesInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 133,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: containersColor,
        ),
        child: const Text('data'),
      ),
    );
  }
}
