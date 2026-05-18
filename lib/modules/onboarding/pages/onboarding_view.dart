import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/modules/Onboarding/pages/onboarding_model.dart';
import 'package:islami/modules/layout/home_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/gen/assets.gen.dart';

class OnboardingView extends StatefulWidget {
  static const String routeName = '/onbording';
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int _courentindex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _courentindex = index;
                });
              },
              children: OnboardingModel.onboardingData.map((item) {
                return Column(
                  children: [
                    Assets.images.imgHeader.image(height: 171, width: 291),
                    Expanded(child: Image.asset(item.image)),
                    SizedBox(height: 30),

                    Text(
                      item.title,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: AppColors.gold,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),                      child: Text(
                        item.disc,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge?.copyWith(
                          color: AppColors.gold,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                );
              }).toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () async {
                  if (_courentindex == 0) {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('isFirstTime', false);

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeLayout.routeName,
                      (route) => false,
                    );
                  } else {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
                child: Text(
                  _courentindex == 0 ? "Skip" : "Back",
                  style: const TextStyle(
                    color: AppColors.gold,
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                  ),
                ),
              ),

              SmoothPageIndicator(
                controller: _pageController,
                count:
                    OnboardingModel.onboardingData.length,
                effect: const WormEffect(
                  activeDotColor: AppColors
                      .gold,
                ),
                onDotClicked: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),

              TextButton(
                onPressed: () async {
                  if (_courentindex ==
                      OnboardingModel.onboardingData.length - 1) {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('isFirstTime', false);

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeLayout.routeName,
                      (route) => false,
                    );
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text(
                  _courentindex == OnboardingModel.onboardingData.length - 1
                      ? "Finish"
                      : "Next",
                  style: const TextStyle(
                    color: AppColors.gold,
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
