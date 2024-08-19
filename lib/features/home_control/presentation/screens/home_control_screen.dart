import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/core/constants/constants.dart';

class HomeControlScreen extends StatelessWidget {
  const HomeControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTextField(),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: containersColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              onPressed: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.focusedChild?.unfocus();
                }
                GoRouter.of(context).pushNamed(RouteNames.notifiactionsScreen);
              },
              icon: SvgPicture.asset(
                'lib/core/assets/icons/notifications.svg',
              ),
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 16),
        child: SizedBox(
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
    List<String> icons = [
      'lib/core/assets/icons/light.svg',
      'lib/core/assets/icons/intercom.svg',
      'lib/core/assets/icons/garage.svg',
      'lib/core/assets/icons/light.svg',
    ];
    List<String> labels = ['Свет 1', 'Домофон', 'Гараж', 'Свет 2'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Электроника',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(
          height: 133,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (BuildContext context, int index) {
              return ElectronicCellwidget(
                title: labels[index],
                icon: icons[index],
              );
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
              Text(
                'Видеонаблюдение',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                width: 70,
                height: 30,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 0),
                    ),
                  ),
                  onPressed: () {},
                  child: SvgPicture.asset(
                    'lib/core/assets/icons/play.svg',
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 133,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return CameraCellwidget(
                title: 'Камера ${index + 1}',
              );
            },
          ),
        ),
      ],
    );
  }
}

class CameraCellwidget extends StatelessWidget {
  const CameraCellwidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: AspectRatio(
        aspectRatio: 1.8,
        child: Ink(
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('lib/core/assets/images/video_camera.jpg')),
            color: containersColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ElectronicCellwidget extends StatelessWidget {
  const ElectronicCellwidget(
      {super.key, required this.title, required this.icon});

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: containersColor,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: mainIconsContainerColor,
                        borderRadius: BorderRadius.circular(100)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset(
                        icon,
                        colorFilter: const ColorFilter.mode(
                            textFieldTextColor, BlendMode.srcIn),
                        width: 5,
                      ),
                    ),
                  ),
                  Text(title),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarTextField extends StatelessWidget {
  const AppBarTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        hintText: 'Поиск',
        hintStyle: const TextStyle(color: unselectedItemColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search, color: unselectedItemColor),
        filled: true,
        fillColor: containersColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
    );
  }
}
