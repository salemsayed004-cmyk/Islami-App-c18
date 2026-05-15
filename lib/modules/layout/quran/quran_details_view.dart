import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';

import '../../../core/gen/assets.gen.dart';

class QuranDetailsView extends StatelessWidget {
  static const String routeName = '/quran_details_view';
  const QuranDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Al-Fatiha")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Assets.images.imgLeftCorner.image(width: 93, height: 92),
                Text(
                  "Al-Fatiha",
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: AppColors.gold,
                  ),
                ),
                Assets.images.imgRightCorner.image(width: 93, height: 92),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: 30,
              itemBuilder: (context, index) {
                return Text(
                  "Al-Fatiha",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: AppColors.gold),
                );
              },
            ),
          ),
          Assets.images.imgBottomDecoration.image(),
        ],
      ),
    );
  }
}
