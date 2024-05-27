import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_payment_app/core/constants/constants.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Ваши данные'),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserMainWidget(),
              ParametersListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class UserMainWidget extends StatelessWidget {
  const UserMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CircleAvatar(
          radius: 47.5,
          child: Icon(Icons.photo_camera),
        ),
        SizedBox(height: 17),
        Text('Алексей',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
        SizedBox(height: 19),
      ],
    );
  }
}

class ParametersListWidget extends StatelessWidget {
  const ParametersListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [
          UserParameterWidget(
            title: '+7 (918) 123-12-12',
            icon: Icon(Icons.person),
            route: RouteNames.changePhoneScreen,
          ),
          UserParameterWidget(
            title: 'efuhufeufe@inbox.ru',
            icon: Icon(Icons.person),
            route: RouteNames.changeEmailScreen,
          ),
          UserParameterWidget(
            title: 'Адреса',
            icon: Icon(Icons.person),
            route: RouteNames.addressesScreen,
          ),
          UserParameterWidget(
            title: 'Документы',
            icon: Icon(Icons.person),
            route: RouteNames.documentsScreen,
          ),
        ],
      ),
    );
  }
}

class UserParameterWidget extends StatelessWidget {
  const UserParameterWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.route});

  final String title;
  final Icon icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).goNamed(route);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 15),
              Expanded(child: Text(title)),
              const Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
