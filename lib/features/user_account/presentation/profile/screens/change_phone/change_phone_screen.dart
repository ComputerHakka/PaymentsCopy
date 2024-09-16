import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/core/util/theme/theme_cubit.dart';
import 'package:personal_payment_app/features/user_account/presentation/bloc/local/user_database_bloc.dart';
import 'package:personal_payment_app/features/user_account/presentation/profile/bloc/bloc/change_contacts_bloc.dart';

class ChangePhoneScreen extends StatefulWidget {
  const ChangePhoneScreen({super.key});

  @override
  State<ChangePhoneScreen> createState() => _ChangePhoneScreenState();
}

class _ChangePhoneScreenState extends State<ChangePhoneScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool isCorrect = true;

  bool checkCorrectInput() {
    if (_phoneController.text.length != 18) {
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
              'Укажите новый номер',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 30),
            TextField(
              keyboardType: TextInputType.number,
              controller: _phoneController,
              inputFormatters: [
                MaskTextInputFormatter(
                  mask: '+7 (###) ###-##-##',
                  filter: {"#": RegExp(r'[0-9]')},
                  type: MaskAutoCompletionType.lazy,
                ),
              ],
              style: const TextStyle(fontSize: 16),
              decoration: getChangeInputDecoration(
                      context.read<ThemeCubit>().state.isDarkMode)
                  .copyWith(
                hintText: '+7',
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                errorText:
                    isCorrect ? null : '* Укажите корректный номер телефона',
                suffixIcon: GestureDetector(
                  child: const Icon(
                    Icons.close_rounded,
                    size: 17,
                    color: unselectedItemColor,
                  ),
                  onTap: () {
                    setState(() {
                      _phoneController.text = '';
                    });
                  },
                ),
              ),
              onTap: () {
                if (_phoneController.text.isEmpty) {
                  _phoneController.text = '+7 ';
                  _phoneController.selection = TextSelection.fromPosition(
                    TextPosition(offset: _phoneController.text.length),
                  );
                }
              },
              onSubmitted: (value) {
                bool correct = checkCorrectInput();
                if (correct) {
                  BlocProvider.of<ChangeContactsBloc>(context)
                      .add(SendPhoneEvent(phone: value));
                  BlocProvider.of<UserDatabaseBloc>(context).add(
                      UpdateUserEvent(
                          phone:
                              value)); //Коллизия данных если серв не отвечает
                }
              },
            ),
            BlocListener<ChangeContactsBloc, ChangeContactsState>(
              child: const SizedBox(),
              listener: (context, state) {
                if (state is ChangeContactsDoneState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      elevation: 5,
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.fromLTRB(16, 0, 16, 30),
                      content: Text('Номер успешно изменен'),
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
            ),
          ],
        ),
      ),
    );
  }
}
