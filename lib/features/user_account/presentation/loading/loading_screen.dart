import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_payment_app/core/constants/constants.dart';
import 'package:personal_payment_app/features/user_account/presentation/bloc/local/user_database_bloc.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserDatabaseBloc, UserDatabaseState>(
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      listener: (context, state) {
        if (state is UserDatabaseLoginState) {
          GoRouter.of(context).goNamed(RouteNames.homeScreen);
        }
        if (state is UserDatabaseNoneState) {
          GoRouter.of(context).goNamed(RouteNames.startScreen);
        }
        // if (state is UserDatabaseLoadingState) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(
        //       elevation: 5,
        //       duration: Duration(seconds: 2),
        //       behavior: SnackBarBehavior.floating,
        //       margin: EdgeInsets.fromLTRB(16, 0, 16, 30),
        //       content: Text('Что-то пошло не так перезагрузите приложение'),
        //     ),
        //   );
        // }
      },
    );
  }
}
