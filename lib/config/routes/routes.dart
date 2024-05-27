import 'package:go_router/go_router.dart';
import 'package:personal_payment_app/core/constants/constants.dart';
import 'package:personal_payment_app/features/authorization/presentation/screens/authorization_screen.dart';
import 'package:personal_payment_app/features/authorization/presentation/screens/start_screen.dart';
import 'package:personal_payment_app/features/history/presentation/screens/history_screen.dart';
import 'package:personal_payment_app/features/home_control/presentation/screens/home_control_screen.dart';
import 'package:personal_payment_app/features/payment/presentation/screens/home/home_screen.dart';
import 'package:personal_payment_app/features/profile/screens/addresses/user_addresses_screen.dart';
import 'package:personal_payment_app/features/profile/screens/change_email/change_email_screen.dart';
import 'package:personal_payment_app/features/profile/screens/change_phone/change_phone_screen.dart';
import 'package:personal_payment_app/features/profile/screens/documents/documents_screen.dart';
import 'package:personal_payment_app/features/profile/screens/profile/user_profile_screen.dart';
import 'package:personal_payment_app/features/registration/presentation/screens/registration_screen.dart';
import 'package:personal_payment_app/features/root/presentation/screens/root_screen.dart';
import 'package:personal_payment_app/features/support/presentation/screens/support_chat_screen.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            RootScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: RouteNames.homeScreen,
                builder: (context, state) => const HomeScreen(),
                routes: [
                  GoRoute(
                    path: 'profile',
                    name: RouteNames.profileScreen,
                    builder: (context, state) => const UserProfileScreen(),
                    routes: [
                      GoRoute(
                        path: 'change_phone',
                        name: RouteNames.changePhoneScreen,
                        builder: (context, state) => const ChangePhoneScreen(),
                      ),
                      GoRoute(
                        path: 'change_email',
                        name: RouteNames.changeEmailScreen,
                        builder: (context, state) => const ChangeEmailScreen(),
                      ),
                      GoRoute(
                        path: 'addresses',
                        name: RouteNames.addressesScreen,
                        builder: (context, state) =>
                            const UserAddressesScreen(),
                      ),
                      GoRoute(
                        path: 'documents',
                        name: RouteNames.documentsScreen,
                        builder: (context, state) =>
                            const UserDocumentsScreen(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/history',
                name: RouteNames.historyScreen,
                builder: (context, state) => const HistoryScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home_control',
                name: RouteNames.homeControlScreen,
                builder: (context, state) => const HomeControlScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/support_chat',
                name: RouteNames.supportChatScreen,
                builder: (context, state) => const SupportChatScreen(),
              ),
            ],
          ),
        ],
      ),
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
    ],
  );
}


// class AppRoutes {
//   static final GoRouter router = GoRouter(
//     initialLocation: '/start',
//     routes: [
//       GoRoute(
//         path: '/start',
//         name: RouteNames.startScreen,
//         builder: (context, state) => const StartScreen(),
//         routes: [
//           GoRoute(
//             path: 'auth',
//             name: RouteNames.authorizationScreen,
//             builder: (context, state) => const AuthorizationScreen(),
//           ),
//           GoRoute(
//             path: 'registration',
//             name: RouteNames.registrationScreen,
//             builder: (context, state) => const RegistrationScreen(),
//           ),
//         ],
//       ),
//       GoRoute(
//         path: '/home',
//         name: RouteNames.homeScreen,
//         builder: (context, state) => const HomeScreen(),
//         routes: [
//           GoRoute(
//             path: 'profile',
//             name: RouteNames.profileScreen,
//             builder: (context, state) => const UserProfileScreen(),
//           ),
//         ],
//       ),
//     ],
//   );
// }
