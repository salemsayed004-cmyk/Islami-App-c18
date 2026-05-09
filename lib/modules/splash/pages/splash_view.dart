import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/modules/layout/home_layout.dart';

import '../../../core/gen/assets.gen.dart';

class SplashView extends StatefulWidget {
  static const String routeName = '/splash';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeLayout.routeName,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 6,
            child: Center(
              child: Assets.images.islamiLogo.image(width: 185, height: 165),
            ),
          ),

          Expanded(
            flex: 1,
            child: Center(
              child: Assets.images.routeLogo.image(width: 244, height: 108),
            ),
          ),
        ],
      ),
    );
  }
}
