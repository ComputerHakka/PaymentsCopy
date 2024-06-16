import 'package:flutter/material.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/features/services/presentation/screens/user_services/user_services_screen.dart';

class ServicesListScreen extends StatelessWidget {
  const ServicesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новые услуги'),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(containersColor),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          )
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.4,
        ),
        itemCount: 14,
        itemBuilder: (_, int index) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: ServiceBoxWidget(
              company: 'ООО Название коомпании',
              service: 'Подача чистой воды',
            ),
          );
        },
      ),
    );
  }
}
