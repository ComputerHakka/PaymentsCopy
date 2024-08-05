import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/core/constants/constants.dart';
import 'package:personal_payment_app/features/user_account/presentation/bloc/local/user_database_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  GoRouter.of(context)
                      .pushNamed(RouteNames.notifiactionsScreen);
                },
                icon: SvgPicture.asset(
                  'lib/core/assets/icons/notifications.svg',
                ),
              ),
            ),
          ],
        ),
        body: SizedBox(
          child: Column(
            children: [
              const UserNameWidget(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7.5),
                child: AccountBalanceWidget(),
              ),
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
                    OptionBoxWidget(title: 'Гараж'),
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
              ),
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
    final user = context.read<UserDatabaseBloc>().state.user!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7.5),
      child: Row(
        children: [
          CircleAvatar(
            radius: 19.5,
            child: Text(user.firstName.substring(0, 1).toUpperCase()),
          ),
          const SizedBox(width: 19),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).goNamed(RouteNames.profileScreen);
            },
            child: Row(
              children: [
                Text(
                  user.firstName,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.arrow_forward_ios_outlined),
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
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          padding: const EdgeInsets.all(14),
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
      ),
    );
  }
}

class AccountBalanceWidget extends StatelessWidget {
  const AccountBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4.4,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: containersColor,
        ),
        child: Row(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ваш баланс',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    '12 729,22 р',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 15,
                  ),
                ),
                shadowColor: WidgetStateColor.transparent,
                foregroundColor: WidgetStatePropertyAll(accentColor),
                backgroundColor: WidgetStateColor.transparent,
                overlayColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 215, 248, 255)),
                shape: WidgetStatePropertyAll(
                  StadiumBorder(
                    side: BorderSide(
                      color: accentColor,
                      width: 2,
                    ),
                  ),
                ),
                visualDensity: VisualDensity.comfortable,
                minimumSize: WidgetStatePropertyAll(
                  Size(140, 50),
                ),
              ),
              child: const Text('Пополнить'),
            ),
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
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Ink(
          height: 133,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: containersColor,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              GoRouter.of(context).goNamed(RouteNames.transactionsScreen);
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Все операции',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  const Text(
                    'Трат в мае\n10 054 р',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 13, height: 1.2),
                  ),
                  Container(
                    height: 10,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: unselectedItemColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Ink(
          height: 133,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: containersColor,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              GoRouter.of(context).goNamed(RouteNames.userServicesScreen);
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ваши услуги',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: unselectedItemColor,
                        radius: 17,
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: unselectedItemColor,
                        radius: 17,
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: unselectedItemColor,
                        radius: 17,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
