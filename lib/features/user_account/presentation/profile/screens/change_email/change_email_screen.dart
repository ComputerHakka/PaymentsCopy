import 'package:flutter/material.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';

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
              decoration: getChangeInputDecoration().copyWith(
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
                if (correct) {}
              },
            ),
          ],
        ),
      ),
    );
  }
}
