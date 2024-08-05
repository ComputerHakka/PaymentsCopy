import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/core/constants/constants.dart';
import 'package:personal_payment_app/features/home/presentation/screens/home/home_screen.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTextField(),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: containersColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(RouteNames.notifiactionsScreen);
              },
              icon: SvgPicture.asset(
                'lib/core/assets/icons/notifications.svg',
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: AccountBalanceWidget(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: TextField(
                decoration: InputDecoration(hintText: 'Номер договора'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: TextField(
                decoration: InputDecoration(hintText: 'Фио абонента'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: Text('Рекомендованный платеж: 7600р'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: TextField(
                decoration: InputDecoration(hintText: 'Сумма'),
              ),
            ),
            const Expanded(child: SizedBox()),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                const Text('Я подтверждаю, что все данные верны')
              ],
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.green),
                overlayColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 83, 148, 85)),
              ),
              onPressed: () {},
              child: const Text('Оплатить'),
            ),
          ],
        ),
      ),
    );
  }
}

//TODO запихнуть все в отедльный виджет он находитяс на четырех или более экранах

class AppBarTextField extends StatelessWidget {
  const AppBarTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        hintText: 'Поиск',
        hintStyle: const TextStyle(color: unselectedItemColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search, color: unselectedItemColor),
        filled: true,
        fillColor: containersColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
    );
  }
}
