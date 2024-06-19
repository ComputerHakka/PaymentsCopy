import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_payment_app/core/constants/constants.dart';
import 'package:personal_payment_app/features/user_account/presentation/authorization/presentation/bloc/auth/remote/remote_auth_bloc.dart';
import 'package:personal_payment_app/injection_container.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              TextField(
                decoration: const InputDecoration(labelText: 'Почта'),
                controller: emailController,
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Пароль',
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  //errorText: '* Неверный пароль',
                ),
                controller: passwordController,
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                onPressed: () {
                  // BlocProvider.of<RemoteAuthBloc>(context).add(LoginEvent(
                  //     emailController.text, passwordController.text));
                },
                child: const Text('Забыли пароль?'),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).goNamed(RouteNames.homeScreen);
                },
                child: const Text('Войти'),
              ),
              // BlocBuilder<RemoteAuthBloc, RemoteAuthState>(
              //   builder: (context, state) {
              //     if (state is RemoteAuthInProccesState) {
              //       return const CircularProgressIndicator();
              //     }
              //     if (state is RemoteAuthSuccessState) {
              //       return Text(state.user!.firstName);
              //     } else {
              //       return Text(state.exception!.response.toString());
              //     }
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
