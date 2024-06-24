import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_payment_app/core/constants/constants.dart';
import 'package:personal_payment_app/features/user_account/presentation/bloc/local/user_database_bloc.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserDatabaseBloc>().state.user;
    final firstname = user != null ? user.firstName : '';
    final email = user != null ? user.email : '';
    final phone = user != null ? user.phone : '';
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Ваши данные'),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserMainWidget(firstName: firstname),
              ParametersListWidget(email: email, phone: phone),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextButton(
                  style: const ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 252, 214, 211))),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                              'Вы уверены что хотите выйти из приложения?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                GoRouter.of(context)
                                    .goNamed(RouteNames.loaderScreen);
                                BlocProvider.of<UserDatabaseBloc>(context).add(
                                  DeleteUserEvent(user: user),
                                );
                                Navigator.of(context).pop();
                              },
                              child: const Text('Ok'),
                            ),
                            const SizedBox(height: 5),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Отмена',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text(
                    'Выйти из приложения',
                    style: TextStyle(color: Colors.red),
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

class UserMainWidget extends StatelessWidget {
  const UserMainWidget({super.key, required this.firstName});

  final String firstName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 47.5,
          child: Icon(Icons.photo_camera),
        ),
        const SizedBox(height: 17),
        Text(firstName,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
        const SizedBox(height: 19),
      ],
    );
  }
}

class ParametersListWidget extends StatelessWidget {
  const ParametersListWidget({
    super.key,
    this.phone,
    required this.email,
  });

  final String? phone;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          UserParameterWidget(
            title: phone ?? 'Укажите номер телефона',
            icon: const Icon(Icons.phone_rounded),
            route: RouteNames.changePhoneScreen,
          ),
          UserParameterWidget(
            title: email,
            icon: const Icon(Icons.person),
            route: RouteNames.changeEmailScreen,
          ),
          const UserParameterWidget(
            title: 'Адреса',
            icon: Icon(Icons.home_rounded),
            route: RouteNames.addressesScreen,
          ),
          const UserParameterWidget(
            title: 'Документы',
            icon: Icon(Icons.library_books_outlined),
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
              Expanded(
                  child: Text(title,
                      style: Theme.of(context).textTheme.displaySmall)),
              const Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
