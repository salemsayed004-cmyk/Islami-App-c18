import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/modules/layout/quran/widgets/most_recently_widget.dart';

import '../../../core/gen/assets.gen.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Assets.images.quranBackground.image(
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Align(
                alignment: Alignment.center,
                child: Assets.images.imgHeader.image(
                  width: MediaQuery.of(context).size.width * 0.7,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.black.withValues(alpha: 0.7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1, color: AppColors.gold),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1, color: AppColors.gold),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1, color: AppColors.gold),
                    ),
                    hintText: 'Sura Name',
                    hintStyle: TextStyle(
                      color: AppColors.titleTextColor  ,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,

                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Assets.icons.icQuran.svg(
                        colorFilter: ColorFilter.mode(
                          AppColors.gold,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              MostRecentlyWidget(),

            ],
          ),
        ),
      ],
    );
  }
}
