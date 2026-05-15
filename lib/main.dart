import 'package:flutter/material.dart';
import 'package:islami/core/theme/theme_manager.dart';
import 'package:islami/modules/layout/home_layout.dart';
import 'package:islami/modules/layout/quran/quran_details_view.dart';

import 'core/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeManager.lightTheme(),
      initialRoute:HomeLayout.routeName,
    routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

