import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/core/util/theme/theme_cubit.dart';
import 'package:personal_payment_app/features/user_account/presentation/bloc/local/user_database_bloc.dart';
import 'package:personal_payment_app/features/user_account/presentation/profile/bloc/bloc/change_contacts_bloc.dart';

class ChangeEmailScreen extends StatefulWidget {
  const ChangeEmailScreen({super.key});

  @override
  State<ChangeEmailScreen> createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool isCorrect = true;

  bool validEmail() {
    if (_emailController.text.isEmpty) {
      setState(() {
        isCorrect = false;
      });
      return false;
    } else {
      setState(() {
        isCorrect = true;
      });
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Изменить e-mail',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 15),
            const Text(
              'На e-mail приходят выписки, счета и справки',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: unselectedItemColor,
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _emailController,
              style: const TextStyle(fontSize: 16),
              decoration: getChangeInputDecoration(
                      context.read<ThemeCubit>().state.isDarkMode)
                  .copyWith(
                hintText: 'Введите ваш e-mail',
                hintStyle: const TextStyle(
                  color: unselectedItemColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                errorText: isCorrect ? null : '* Укажите корректный email',
                suffixIcon: GestureDetector(
                  child: const Icon(
                    Icons.close_rounded,
                    size: 17,
                    color: unselectedItemColor,
                  ),
                  onTap: () {
                    setState(() {
                      _emailController.text = '';
                    });
                  },
                ),
              ),
              onSubmitted: (value) {
                bool correct = validEmail();
                if (correct) {
                  BlocProvider.of<ChangeContactsBloc>(context)
                      .add(SendEmailEvent(email: value));
                  BlocProvider.of<UserDatabaseBloc>(context)
                      .add(UpdateUserEvent(email: value));
                }
              },
            ),
            BlocListener<ChangeContactsBloc, ChangeContactsState>(
              listener: (context, state) {
                if (state is ChangeContactsDoneState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      elevation: 5,
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.fromLTRB(16, 0, 16, 30),
                      content: Text('Email успешно изменен'),
                    ),
                  );
                  BlocProvider.of<ChangeContactsBloc>(context)
                      .add(const ExitPageEvent());
                  GoRouter.of(context).pop();
                }
                if (state is ChangeContactsFailedState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      elevation: 5,
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.fromLTRB(16, 0, 16, 30),
                      content: Text('Что-то пошло не так'),
                    ),
                  );
                }
              },
              child: const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
