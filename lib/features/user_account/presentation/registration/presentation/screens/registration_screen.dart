import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/features/user_account/presentation/registration/presentation/bloc/remote/remote_registration_bloc.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();
  List<bool> checkTexFieldsForEmpty = [false, false, false, false, false];
  bool onPressed = false;

  void checkTextFields() {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        passwordAgainController.text.isNotEmpty) {
      setState(() {
        onPressed = true;
      });
    } else {
      setState(() {
        onPressed = false;
      });
    }
  }

  void createUser() {
    BlocProvider.of<RemoteRegistrationBloc>(context).add(
      CreateUserEvent(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Регистрация',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Имя',
                    labelStyle: TextStyle(color: textFieldTextColor),
                  ),
                  controller: firstNameController,
                  onChanged: (value) => checkTextFields(),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Фамилия',
                    labelStyle: TextStyle(color: textFieldTextColor),
                  ),
                  controller: lastNameController,
                  onChanged: (value) => checkTextFields(),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Почта',
                    labelStyle: TextStyle(color: textFieldTextColor),
                  ),
                  controller: emailController,
                  onChanged: (value) => checkTextFields(),
                ),
                const SizedBox(height: 16),
                const Text(
                  'На вашу почту поступит письмо\nс подтверждением аккаунта',
                  style: TextStyle(color: textFieldTextColor),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Пароль',
                    labelStyle: TextStyle(color: textFieldTextColor),
                  ),
                  obscureText: true,
                  controller: passwordController,
                  onChanged: (value) => checkTextFields(),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Пароль ещё раз',
                    labelStyle: TextStyle(color: textFieldTextColor),
                  ),
                  obscureText: true,
                  controller: passwordAgainController,
                  onChanged: (value) => checkTextFields(),
                ),
                const SizedBox(height: 8),
                const Column(
                  children: [
                    CorrectPasswordCheckotWidget(
                        isCorrect: false,
                        isMain: true,
                        parameter: 'Надежность пароля: слабая'),
                    CorrectPasswordCheckotWidget(
                        isCorrect: false,
                        isMain: false,
                        parameter: 'Не менее 8 символов'),
                    CorrectPasswordCheckotWidget(
                        isCorrect: false,
                        isMain: false,
                        parameter: 'Как минимум 1 цифра'),
                    CorrectPasswordCheckotWidget(
                        isCorrect: false,
                        isMain: false,
                        parameter: 'Должен иметь хотя бы один символ'),
                    CorrectPasswordCheckotWidget(
                        isCorrect: false,
                        isMain: false,
                        parameter: 'Не должен содержать пробелов'),
                  ],
                ),
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    text: 'Нажав «Принять и продолжить», я соглашаюсь с ',
                    style: getTextStyle(false),
                    children: [
                      TextSpan(
                          text: 'Условиями обслуживания ',
                          style: getTextStyle(true)),
                      TextSpan(
                          text: 'Оплаты услуг, ', style: getTextStyle(false)),
                      TextSpan(
                          text: 'Условиями обслуживания платежей ',
                          style: getTextStyle(true)),
                      TextSpan(text: 'и ', style: getTextStyle(false)),
                      TextSpan(
                          text: 'Политикой уведомлений',
                          style: getTextStyle(true)),
                      TextSpan(
                          text: ', а также принимаю ',
                          style: getTextStyle(false)),
                      TextSpan(
                          text: 'Политику конфиденциальности.',
                          style: getTextStyle(true)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: onPressed ? createUser : null,
                  child: BlocConsumer<RemoteRegistrationBloc,
                      RemoteRegistrationState>(
                    listener: (context, state) {
                      if (state is RemoteRegistrationSuccessState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            elevation: 5,
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.fromLTRB(16, 0, 16, 30),
                            content: Text('Регистрация прошла успешно'),
                          ),
                        );
                        GoRouter.of(context).pop();
                      }
                      if (state is RemoteRegistrationFailedState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            elevation: 5,
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.fromLTRB(16, 0, 16, 30),
                            content:
                                Text('Что-то пошло не так.\nПопробуйте позже'),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is RemoteRegistrationInitialState ||
                          state is RemoteRegistrationFailedState) {
                        return const Text('Принять и продолжить');
                      }
                      if (state is RemoteRegistrationInProccesState) {
                        return const CircularProgressIndicator();
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CorrectPasswordCheckotWidget extends StatelessWidget {
  const CorrectPasswordCheckotWidget(
      {super.key,
      required this.isCorrect,
      required this.isMain,
      required this.parameter});

  final bool isCorrect;
  final bool isMain;
  final String parameter;

  @override
  Widget build(BuildContext context) {
    final Color color = isCorrect ? Colors.green : Colors.red;
    final Icon icon = isMain
        ? Icon(
            Icons.info,
            color: color,
          )
        : isCorrect
            ? const Icon(Icons.check_rounded)
            : const Icon(Icons.close_outlined);
    return Row(
      children: [
        icon,
        const SizedBox(width: 8),
        Text(parameter),
      ],
    );
  }
}

TextStyle getTextStyle(bool isLink) {
  return TextStyle(
    color: isLink ? accentColor : Colors.black,
    decoration: isLink ? TextDecoration.underline : TextDecoration.none,
    height: 1.4,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}
