import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_payment_app/config/routes/routes.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/core/util/theme/theme_cubit.dart';
import 'package:personal_payment_app/features/user_account/presentation/bloc/local/user_database_bloc.dart';
import 'package:personal_payment_app/injection_container.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 2));
  await initializeDependencies();
  //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.white,
  // ));
  // Задаем стиль для строки состояния
  runApp(const PersonalPaymentApp());
}

class PersonalPaymentApp extends StatelessWidget {
  const PersonalPaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserDatabaseBloc>(
          create: (context) => container()..add(const GetUserEvent()),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => container()..getThemeFromCatch(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('ru'),
            ],
            title: 'Payment',
            debugShowCheckedModeBanner: false,
            theme: appTheme(context, isDarkMode: state.isDarkMode),
            routerConfig: AppRoutes.router,
          );
        },
      ),
    );
  }
}
