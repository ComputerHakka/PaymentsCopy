import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_payment_app/config/routes/routes.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
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
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: appTheme(context),
      routerConfig: AppRoutes.router,
    );
  }
}
