import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/core/constants/constants.dart';

class UserServicesScreen extends StatelessWidget {
  const UserServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ваши услуги'),
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
      body: Column(
        children: [
          SizedBox(
            height: 121,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return const ServiceBoxWidget(
                  company: 'ООО Название компании',
                  service: 'Подача чистой воды',
                );
              },
            ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: NewServicesWidget(),
          ),
        ],
      ),
    );
  }
}

class ServiceBoxWidget extends StatelessWidget {
  const ServiceBoxWidget({
    super.key,
    required this.company,
    required this.service,
    this.isBoxInContainer = false,
  });

  final String company;
  final String service;
  final bool isBoxInContainer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).goNamed(RouteNames.serviceDetailsScreen);
      },
      child: Container(
        height: 107,
        width: 161,
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isBoxInContainer ? Colors.white : containersColor,
          border: Border.all(color: borderColor, width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(radius: 17.5),
            const SizedBox(height: 6),
            Text(company, style: const TextStyle(fontSize: 10)),
            Text(service, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class NewServicesWidget extends StatelessWidget {
  const NewServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: containersColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text('Выбрать новые услуги'),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 121,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return const ServiceBoxWidget(
                  company: 'ООО Название компании',
                  service: 'Подача чистой воды',
                  isBoxInContainer: true,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ElevatedButton(
              onPressed: () {
                GoRouter.of(context).goNamed(RouteNames.servicesListScreen);
              },
              child: const Text('Все 42 предложения'),
            ),
          ),
        ],
      ),
    );
  }
}
