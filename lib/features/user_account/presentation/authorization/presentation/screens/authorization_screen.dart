import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_payment_app/core/constants/constants.dart';
import 'package:personal_payment_app/features/user_account/domain/entities/user.dart';
import 'package:personal_payment_app/features/user_account/presentation/authorization/presentation/bloc/auth/remote/remote_auth_bloc.dart';
import 'package:personal_payment_app/features/user_account/presentation/bloc/local/user_database_bloc.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? errorText;
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    void login() {
      BlocProvider.of<RemoteAuthBloc>(context)
          .add(LoginEvent(emailController.text, passwordController.text));
    }

    Future<void> saveUser(UserEntity user) async {
      BlocProvider.of<UserDatabaseBloc>(context).add(SaveUserEvent(user: user));
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
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    child: obscure
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                  ),
                  errorText: errorText,
                ),
                obscureText: obscure,
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
                    GoRouter.of(context).goNamed(RouteNames.loaderScreen);
                    saveUser(state.user!);
                    // BlocProvider.of<UserDatabaseBloc>(context)
                    //     .add(SaveUserEvent(user: state.user));
                  }
                  if (state is RemoteAuthFailedState) {
                    if (state.exception!.type == DioExceptionType.badResponse) {
                      setState(() {
                        errorText = '* Неверный пароль';
                      });
                    }
                    if (state.exception!.type ==
                        DioExceptionType.connectionError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          elevation: 5,
                          duration: Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.fromLTRB(16, 0, 16, 30),
                          content: Text('Проблема с соединением'),
                        ),
                      );
                    }
                    if (state.exception!.type ==
                        DioExceptionType.connectionTimeout) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          elevation: 5,
                          duration: Duration(seconds: 4),
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.fromLTRB(16, 0, 16, 30),
                          content: Text(
                            'Вышло время на ответ сервера, проверьте подключение к интернету',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
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
