import 'package:flutter/material.dart';
import 'package:islami/modules/Onboarding/pages/onboarding_view.dart';
import 'package:islami/modules/layout/quran/quran_details_view.dart';
import 'package:islami/modules/splash/pages/first_splash_view.dart';

import '../../modules/layout/home_layout.dart';
import '../../modules/splash/pages/splash_view.dart';



abstract class AppRoutes {
  static Map<String, WidgetBuilder> routes={

    FirstSplashView.routeName:(context)=>FirstSplashView(),
    OnboardingView.routeName:(context)=>OnboardingView(),
    SplashView.routeName:(context)=>SplashView(),
    HomeLayout.routeName:(context)=>HomeLayout(),
    QuranDetailsView.routeName:(context)=>QuranDetailsView(),
  };

  }
