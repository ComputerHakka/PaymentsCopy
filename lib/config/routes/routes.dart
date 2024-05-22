import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_payment_app/core/constants/constants.dart';
import 'package:personal_payment_app/features/authorization/presentation/screens/authorization_screen.dart';
import 'package:personal_payment_app/features/authorization/presentation/screens/start_screen.dart';
import 'package:personal_payment_app/features/payment/presentation/screens/home/home_screen.dart';
import 'package:personal_payment_app/features/registration/presentation/screens/registration_screen.dart';
import 'package:personal_payment_app/internal/landing_page_bloc/landing_page_bloc.dart';
import 'package:personal_payment_app/presentation/screens/landing_page.dart';

// class RouteGenerator {
//   final LandingPageBloc landingPageBloc = LandingPageBloc();
//   Route<dynamic> generateRoute(RouteSettings settings) {
//     //final args = settings.arguments;
//     switch (settings.name) {
//       case '/':
//         return MaterialPageRoute(
//           builder: (_) => BlocProvider<LandingPageBloc>.value(
//             value: landingPageBloc,
//             child: const LandingScreen(),
//           ),
//         );
//       default:
//         return _errorRoute();
//     }
//   }

//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(
//       builder: (_) {
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text('Error'),
//           ),
//           body: const Center(
//             child: Text('Error'),
//           ),
//         );
//       },
//     );
//   }
// }

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/start',
    routes: [
      GoRoute(
        path: '/start',
        name: RouteNames.startScreen,
        builder: (context, state) => const StartScreen(),
        routes: [
          GoRoute(
            path: 'auth',
            name: RouteNames.authorizationScreen,
            builder: (context, state) => const AuthorizationScreen(),
          ),
          GoRoute(
            path: 'registration',
            name: RouteNames.registrationScreen,
            builder: (context, state) => const RegistrationScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/home',
        name: RouteNames.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
