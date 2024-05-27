import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }

  List<BottomNavigationBarItem> get _buildBottomNavBarItems => [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Главная',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.access_time_filled_rounded),
          label: 'История',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.control_camera_rounded),
          label: 'Контроль',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.chat_rounded),
          label: 'Поддержка',
        ),
      ];
}
