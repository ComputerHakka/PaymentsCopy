import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/core/constants/constants.dart';
import 'package:personal_payment_app/features/services/domain/entities/service.dart';

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
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.tertiary),
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
              itemCount: ServiceMock.userServices.length,
              itemBuilder: (BuildContext context, int index) {
                return ServiceBoxWidget(
                  service: ServiceMock.userServices[index],
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
    required this.service,
    this.isBoxInContainer = false,
  });

  final ServiceEntity service;
  final bool isBoxInContainer;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(
          RouteNames.serviceDetailsScreen,
          extra: service,
        );
      },
      child: Container(
        height: 107,
        width: 161,
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isBoxInContainer
              ? isDarkMode
                  ? Colors.black
                  : Colors.white
              : Theme.of(context).colorScheme.tertiary,
          border: Border.all(
              color: isDarkMode ? Colors.black : borderColor, width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                image: service.photoPath != null
                    ? DecorationImage(image: AssetImage(service.photoPath!))
                    : null,
                color: service.photoPath == null ? secondaryColor : null,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              service.companyId!,
              style: const TextStyle(fontSize: 10),
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.fade,
            ),
            Text(
              service.name,
              style: const TextStyle(fontSize: 12),
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.fade,
            ),
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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.tertiary,
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
                return ServiceBoxWidget(
                  service: ServiceMock.anotherServices[index],
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
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(isDarkMode
                    ? const Color.fromARGB(255, 54, 84, 114)
                    : lightButton),
                foregroundColor: const WidgetStatePropertyAll(accentColor),
              ),
              child:
                  Text('Все ${ServiceMock.anotherServices.length} предложения'),
            ),
          ),
        ],
      ),
    );
  }
}
