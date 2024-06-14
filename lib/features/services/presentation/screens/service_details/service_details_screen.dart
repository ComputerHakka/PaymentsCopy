import 'package:flutter/material.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TitleInfoWidget(),
                SizedBox(height: 15),
                _TechnologyInfoWidget(),
                SizedBox(height: 15),
                _PaymentMethodWidget(),
                SizedBox(height: 15),
                _ConnectionPeriodWidget(),
                SizedBox(height: 15),
                _ServiceCostWidget(),
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

class _ServiceCostWidget extends StatelessWidget {
  const _ServiceCostWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Стоимость'),
        SizedBox(height: 15),
        Text('15 000р'),
      ],
    );
  }
}

class _ConnectionPeriodWidget extends StatelessWidget {
  const _ConnectionPeriodWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Срок подключения'),
        SizedBox(height: 15),
        Text('5 часов в любой для вас день'),
      ],
    );
  }
}

class _PaymentMethodWidget extends StatelessWidget {
  const _PaymentMethodWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Как оплачивать'),
        SizedBox(height: 15),
        Text('Онлайн или на кассе любой картой'),
      ],
    );
  }
}

class _TechnologyInfoWidget extends StatelessWidget {
  const _TechnologyInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Технология'),
        SizedBox(height: 15),
        Text(
            'Очищаем воду от механических примесей, убираем железо и соли жесткости, получаем воду для технических нужд, Получаем чистую воду'),
      ],
    );
  }
}

class _TitleInfoWidget extends StatelessWidget {
  const _TitleInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Питьевые системы'),
        SizedBox(height: 15),
        Text(
            'Установка наших питьевых систем в домах делает воду доступной для всех жильцов. Они могут получать чистую воду прямо у себя дома или в обществе...'),
      ],
    );
  }
}
