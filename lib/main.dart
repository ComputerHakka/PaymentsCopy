import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_payment_app/config/routes/routes.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/features/user_account/presentation/bloc/local/user_database_bloc.dart';
import 'package:personal_payment_app/injection_container.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.white,
  // ));
  runApp(const PersonalPaymentApp());
}

class PersonalPaymentApp extends StatelessWidget {
  const PersonalPaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserDatabaseBloc>(
      create: (context) => container()..add(const GetUserEvent()),
      child: MaterialApp.router(
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
        theme: appTheme(context),
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
