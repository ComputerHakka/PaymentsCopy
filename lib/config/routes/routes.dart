import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_payment_app/core/constants/constants.dart';
import 'package:personal_payment_app/features/user_account/presentation/authorization/presentation/bloc/auth/remote/remote_auth_bloc.dart';
import 'package:personal_payment_app/features/user_account/presentation/authorization/presentation/screens/authorization_screen.dart';
import 'package:personal_payment_app/features/user_account/presentation/authorization/presentation/screens/start_screen.dart';
import 'package:personal_payment_app/features/history/presentation/bloc/filter/filter_transactions_bloc.dart';
import 'package:personal_payment_app/features/history/presentation/screens/history_screen.dart';
import 'package:personal_payment_app/features/home_control/presentation/screens/home_control_screen.dart';
import 'package:personal_payment_app/features/payment/presentation/screens/home/home_screen.dart';
import 'package:personal_payment_app/features/user_account/presentation/profile/screens/addresses/user_addresses_screen.dart';
import 'package:personal_payment_app/features/user_account/presentation/profile/screens/change_email/change_email_screen.dart';
import 'package:personal_payment_app/features/user_account/presentation/profile/screens/change_phone/change_phone_screen.dart';
import 'package:personal_payment_app/features/user_account/presentation/profile/screens/documents/documents_screen.dart';
import 'package:personal_payment_app/features/user_account/presentation/profile/screens/profile/user_profile_screen.dart';
import 'package:personal_payment_app/features/user_account/presentation/registration/presentation/screens/registration_screen.dart';
import 'package:personal_payment_app/features/root/presentation/screens/root_screen.dart';
import 'package:personal_payment_app/features/services/domain/entities/service.dart';
import 'package:personal_payment_app/features/services/presentation/screens/service_details/service_details_screen.dart';
import 'package:personal_payment_app/features/services/presentation/screens/services_list/services_list_screen.dart';
import 'package:personal_payment_app/features/services/presentation/screens/user_services/user_services_screen.dart';
import 'package:personal_payment_app/features/support/presentation/bloc/bloc/messages_bloc.dart';
import 'package:personal_payment_app/features/support/presentation/screens/support_chat_screen.dart';
import 'package:personal_payment_app/features/transactions/presentation/screens/transaction_details/transaction_details_screen.dart';
import 'package:personal_payment_app/features/transactions/presentation/screens/transactions_list/transactions_list_screen.dart';
import 'package:personal_payment_app/injection_container.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/start',
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
                  GoRoute(
                      path: 'transactions',
                      name: RouteNames.transactionsScreen,
                      builder: (context, state) =>
                          const TransactionsListScreen(),
                      routes: [
                        GoRoute(
                          path: 'transaction_details',
                          name: RouteNames.transactionDetailsScreen,
                          builder: (context, state) =>
                              const TransactionDetailsScreen(),
                        )
                      ]),
                  GoRoute(
                    path: 'user_services',
                    name: RouteNames.userServicesScreen,
                    builder: (context, state) => const UserServicesScreen(),
                    routes: [
                      GoRoute(
                        path: 'services_list',
                        name: RouteNames.servicesListScreen,
                        builder: (context, state) => const ServicesListScreen(),
                        routes: [
                          GoRoute(
                              path: 'service_details',
                              name: RouteNames.serviceDetailsScreen,
                              builder: (context, state) {
                                ServiceEntity service =
                                    state.extra as ServiceEntity;
                                return ServiceDetailsScreen(
                                  currentService: service,
                                );
                              })
                        ],
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
                builder: (context, state) =>
                    BlocProvider<FilterTransactionsBloc>(
                  create: (context) =>
                      container()..add(const ChangeFilterEvent(index: 0)),
                  child: const HistoryScreen(),
                ),
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
                builder: (context, state) => BlocProvider<MessagesBloc>(
                  create: (context) =>
                      container()..add(const GetMessagesEvent()),
                  child: const SupportChatScreen(),
                ),
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
            builder: (context, state) => BlocProvider<RemoteAuthBloc>(
              create: (context) => container(),
              child: const AuthorizationScreen(),
            ),
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
