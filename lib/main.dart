import 'package:flutter/material.dart';
import 'package:islami/core/theme/theme_manager.dart';
import 'package:islami/modules/Onboarding/pages/onboarding_view.dart';
import 'package:islami/modules/layout/home_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

  runApp(MyApp(isFirstTime: isFirstTime));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeManager.lightTheme(),

      initialRoute: isFirstTime ? OnboardingView.routeName : HomeLayout.routeName,

      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}