import 'package:flutter/material.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/features/services/domain/entities/service.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key, required this.currentService});

  final ServiceEntity currentService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 4),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'lib/core/assets/images/service_empty_photo.png',
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TitleInfoWidget(
                  title: currentService.name,
                  description: currentService.description,
                ),
                const SizedBox(height: 15),
                _TechnologyInfoWidget(technology: currentService.technology),
                const SizedBox(height: 15),
                _PaymentMethodWidget(paymentMethod: currentService.howToPay),
                const SizedBox(height: 15),
                _ConnectionPeriodWidget(
                    connectionPeriod: currentService.connectionPeriod),
                const SizedBox(height: 15),
                _ServiceCostWidget(cost: currentService.cost),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Подключить'),
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleInfoWidget extends StatelessWidget {
  const _TitleInfoWidget({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 15),
        Text(description),
      ],
    );
  }
}

class _TechnologyInfoWidget extends StatelessWidget {
  const _TechnologyInfoWidget({
    super.key,
    required this.technology,
  });

  final String technology;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Технология',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: unselectedItemColor,
          ),
        ),
        const SizedBox(height: 15),
        Text(technology),
      ],
    );
  }
}

class _PaymentMethodWidget extends StatelessWidget {
  const _PaymentMethodWidget({
    super.key,
    required this.paymentMethod,
  });

  final String paymentMethod;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Как оплачивать',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: unselectedItemColor,
          ),
        ),
        const SizedBox(height: 15),
        Text(paymentMethod),
      ],
    );
  }
}

class _ConnectionPeriodWidget extends StatelessWidget {
  const _ConnectionPeriodWidget({
    super.key,
    required this.connectionPeriod,
  });

  final String connectionPeriod;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Срок подключения',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: unselectedItemColor,
          ),
        ),
        const SizedBox(height: 15),
        Text(connectionPeriod),
      ],
    );
  }
}

class _ServiceCostWidget extends StatelessWidget {
  const _ServiceCostWidget({
    super.key,
    required this.cost,
  });

  final double cost;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Стоимость',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: unselectedItemColor,
          ),
        ),
        const SizedBox(height: 15),
        Text('${cost.toString()}р'),
      ],
    );
  }
}
