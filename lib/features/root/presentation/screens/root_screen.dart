import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: containersColor,
              blurRadius: 4.0,
              offset: Offset(0.0, -5),
            )
          ],
        ),
        child: BottomNavigationBar(
          selectedFontSize: 12,
          backgroundColor: Colors.white,

          /// Лист элементов для нижнего навигационного бара.
          items: _buildBottomNavBarItems,

          /// Текущий индекс нижнего навигационного бара.
          currentIndex: navigationShell.currentIndex,

          /// Обработчик нажатия на элемент нижнего навигационного бара.
          onTap: (index) => navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          ),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> get _buildBottomNavBarItems => [
        const BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Icon(Icons.home_filled),
          ),
          label: 'Главная',
        ),
        const BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Icon(Icons.access_time_filled_rounded),
          ),
          label: 'История',
        ),
        const BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Icon(Icons.control_camera_rounded),
          ),
          label: 'Контроль',
        ),
        const BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Icon(Icons.chat_rounded),
          ),
          label: 'Поддержка',
        ),
      ];
}
