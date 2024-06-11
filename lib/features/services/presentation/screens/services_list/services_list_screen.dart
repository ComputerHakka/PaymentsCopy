import 'package:flutter/material.dart';
import 'package:personal_payment_app/features/services/presentation/screens/user_services/user_services_screen.dart';

class ServicesListScreen extends StatelessWidget {
  const ServicesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новые услуги'),
        centerTitle: false,
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
