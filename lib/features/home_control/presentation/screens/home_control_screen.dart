import 'package:flutter/material.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';

class HomeControlScreen extends StatelessWidget {
  const HomeControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CmerasControlWidget(),
            ElectronicsControlWidget(),
          ],
        ),
      ),
    );
  }
}

class ElectronicsControlWidget extends StatelessWidget {
  const ElectronicsControlWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Электроника'),
        ),
        SizedBox(
          height: 133,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (BuildContext context, int index) {
              return const ElectronicCellwidget(title: 'Чайник');
            },
          ),
        ),
      ],
    );
  }
}

class CmerasControlWidget extends StatelessWidget {
  const CmerasControlWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Видеонаблюдение'),
              SizedBox(
                width: 70,
                height: 30,
                child: ElevatedButton(
                    style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 0),
                      ),
                    ),
                    onPressed: () {},
                    child: const Icon(Icons.play_arrow_rounded)),
              )
            ],
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            scrollDirection: Axis.horizontal,
            children: [],
          ),
        ),
      ],
    );
  }
}

class CameraCellwidget extends StatelessWidget {
  const CameraCellwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ElectronicCellwidget extends StatelessWidget {
  const ElectronicCellwidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: containersColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
