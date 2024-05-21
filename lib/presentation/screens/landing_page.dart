import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_payment_app/internal/landing_page_bloc/landing_page_bloc.dart';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.grid_3x3),
    label: 'Category',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.search_outlined),
    label: 'Search',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite_outline),
    label: 'Favorite',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_bag_outlined),
    label: 'Cart',
  ),
];

const List<Widget> bottomnavScreen = <Widget>[
  Text('Index 0: Home'),
  Text('Index 1: Category'),
  Text('Index 2: Search'),
  Text('Index 3: Favorite'),
  Text('Index 4: Cart'),
];

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingPageBloc, LandingPageState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: bottomnavScreen.elementAt(state.tabIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavItems,
            currentIndex: state.tabIndex,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              BlocProvider.of<LandingPageBloc>(context).add(
                TabChangeEvent(tabIndex: index),
              );
            },
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
