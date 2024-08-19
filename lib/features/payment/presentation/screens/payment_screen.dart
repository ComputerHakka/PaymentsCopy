import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/core/constants/constants.dart';
import 'package:personal_payment_app/features/home/presentation/screens/home/home_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool agree = false;

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
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.focusedChild?.unfocus();
                }
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                'Быстрая оплата',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
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
              child: Text(
                'Рекомендованный платеж: 7600р',
                style: TextStyle(color: textFieldTextColor),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: TextField(
                decoration: InputDecoration(hintText: 'Сумма'),
                keyboardType: TextInputType.number,
              ),
            ),
            const Expanded(child: SizedBox()),
            Row(
              children: [
                Checkbox(
                  activeColor: accentColor,
                  value: agree,
                  onChanged: (value) {
                    setState(() {
                      agree = !agree;
                    });
                  },
                ),
                const Text(
                  'Я подтверждаю, что все данные верны',
                  style: TextStyle(color: textFieldTextColor),
                )
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
