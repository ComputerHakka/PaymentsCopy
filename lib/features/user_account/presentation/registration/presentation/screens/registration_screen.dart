import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  List<bool> checkPasswordValid = [false, false, false, false, false];
  bool onPressed = false;
  bool passwordEqual = true;

  void checkTextFields() {
    final checkEqual = checkEqualPassword();
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        passwordAgainController.text.isNotEmpty &&
        !checkPasswordValid.any((e) => e == false) &&
        checkEqual) {
      setState(() {
        onPressed = true;
      });
    } else {
      setState(() {
        onPressed = false;
      });
    }
  }

  bool checkEqualPassword() {
    if (passwordController.text == passwordAgainController.text) {
      setState(() {
        passwordEqual = true;
      });
      return true;
    } else {
      setState(() {
        passwordEqual = false;
      });
      return false;
    }
  }

  bool validatePassword(String value) {
    checkPasswordValid[1] = value.length < 8 ? false : true;
    checkPasswordValid[2] = !RegExp(r'[0-9]').hasMatch(value) ? false : true;
    checkPasswordValid[3] = !RegExp(r'[A-Za-z]').hasMatch(value) ? false : true;
    checkPasswordValid[4] =
        RegExp(r'\s').hasMatch(value) && value.isEmpty ? false : true;
    if (checkPasswordValid.skip(1).any((e) => e == false)) {
      checkPasswordValid[0] = false;
      setState(() {});
      return false;
    }
    checkPasswordValid[0] = true;
    setState(() {});
    return true;
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
                  onChanged: (value) {
                    validatePassword(value);
                    checkTextFields();
                  },
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Пароль ещё раз',
                    labelStyle: const TextStyle(color: textFieldTextColor),
                    errorText: passwordEqual ? null : '* Пароли не совпадают',
                  ),
                  obscureText: true,
                  controller: passwordAgainController,
                  onChanged: (value) {
                    checkEqualPassword();
                    checkTextFields();
                  },
                ),
                const SizedBox(height: 8),
                Column(
                  children: [
                    CorrectPasswordCheckotWidget(
                        isCorrect: checkPasswordValid[0],
                        isMain: true,
                        parameter: checkPasswordValid[0]
                            ? 'Надежность пароля: надежный'
                            : 'Надежность пароля: слабая'),
                    CorrectPasswordCheckotWidget(
                        isCorrect: checkPasswordValid[1],
                        isMain: false,
                        parameter: 'Не менее 8 символов'),
                    CorrectPasswordCheckotWidget(
                        isCorrect: checkPasswordValid[2],
                        isMain: false,
                        parameter: 'Как минимум 1 цифра'),
                    CorrectPasswordCheckotWidget(
                        isCorrect: checkPasswordValid[3],
                        isMain: false,
                        parameter: 'Должен иметь хотя бы один символ'),
                    CorrectPasswordCheckotWidget(
                        isCorrect: checkPasswordValid[4],
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
    fontFamily: 'Ubuntu',
    height: 1.4,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}
