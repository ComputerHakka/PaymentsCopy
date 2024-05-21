import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_payment_app/config/routes/routes.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/features/authorization/presentation/screens/authorization_screen.dart';
import 'package:personal_payment_app/features/authorization/presentation/screens/start_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.white,
  // ));
  runApp(const PersonalPaymentApp());
}

class PersonalPaymentApp extends StatelessWidget {
  const PersonalPaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: appTheme(context),
      home: const AuthorizationScreen(),
      // initialRoute: '/',
      // onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}
