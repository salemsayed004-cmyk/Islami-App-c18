import 'package:flutter/material.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../model/hadith_data.dart';

class HadithItem extends StatelessWidget {
  final HadithData data;
  const HadithItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);


    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.hadithcardbackground1.provider(),
        ),
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 12.0,
            ),
            child: Row(
              children: [
                Assets.images.imgLeftCorner.image(
                  width: 90,
                  height: 90,
                  color: AppColors.black,
                ),
                Expanded(
                  child: Text(
                    data.hadithTitle,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),
                Assets.images.imgRightCorner.image(
                  width: 90,
                  height: 90,
                  color: AppColors.black,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      data.hadithDesc,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Assets.images.imgBottomDecoration.image(
            color: AppColors.black,
          ),
        ],
      ),
    );
  }}