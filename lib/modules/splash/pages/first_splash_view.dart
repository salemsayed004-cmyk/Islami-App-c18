import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/modules/splash/pages/splash_view.dart';
import '../../../core/gen/assets.gen.dart';

class FirstSplashView extends StatefulWidget {
  static const String routeName = '/first_splash';
  const FirstSplashView({super.key});

  @override
  State<FirstSplashView> createState() => _FirstSplashViewState();
}

class _FirstSplashViewState extends State<FirstSplashView> {
  @override
  void initState() {
    super.initState( );
    Timer(Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        SplashView.routeName,
            (route) => false,
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Assets.images.splashBackground.image(
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Assets.images.glow.image(width: size.width * 0.25),
        ),
        Positioned(
          top: 0,
          height: size.height * 1.45,
          right: 0,
          child: Assets.images.shapeR.image(width: size.width * 0.20),
        ),
        Positioned(
          top: 0,
          height: size.height * .63,
          right: 0,
          child: Assets.images.shapeL.image(width: size.width * 1.78),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Assets.images.mosque011.image(width: 250, height: 108),
                ),
                Expanded(
                  flex: 2,
                  child: Assets.images.islamiLogo2.image(
                    width: 173,
                    height: 232,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Assets.images.routeLogo.image(width: 244, height: 108),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
