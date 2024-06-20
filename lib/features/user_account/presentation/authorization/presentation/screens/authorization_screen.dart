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
  String? errorText;

  @override
  Widget build(BuildContext context) {
    void login() {
      BlocProvider.of<RemoteAuthBloc>(context)
          .add(LoginEvent(emailController.text, passwordController.text));
      if (BlocProvider.of<RemoteAuthBloc>(context).state.user == null) {
        setState(() {
          errorText = '* Неверный пароль';
        });
      }
    }

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
                onChanged: (value) {
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Пароль',
                  suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                  errorText: errorText,
                ),
                controller: passwordController,
                onChanged: (value) {
                  setState(() {});
                },
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {},
                child: const Text('Забыли пароль?'),
              ),
              const SizedBox(height: 16),
              BlocConsumer<RemoteAuthBloc, RemoteAuthState>(
                builder: (context, state) {
                  bool onPressed = false;
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    onPressed = true;
                  }

                  if (state is RemoteAuthInitialState ||
                      state is RemoteAuthFailedState) {
                    return ElevatedButton(
                      onPressed: onPressed ? login : null,
                      child: const Text('Войти'),
                    );
                  }
                  if (state is RemoteAuthInProccesState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return const SizedBox();
                },
                listener: (BuildContext context, RemoteAuthState state) {
                  if (state is RemoteAuthSuccessState) {
                    GoRouter.of(context).goNamed(RouteNames.homeScreen);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
