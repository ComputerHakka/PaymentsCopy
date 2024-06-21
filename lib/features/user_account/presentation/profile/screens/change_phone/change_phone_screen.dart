import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';

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
              decoration: getChangeInputDecoration().copyWith(
                hintText: '+7',
                hintStyle: const TextStyle(
                  color: Colors.black,
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
              onSubmitted: (value) {
                checkCorrectInput();
              },
            ),
          ],
        ),
      ),
    );
  }
}
