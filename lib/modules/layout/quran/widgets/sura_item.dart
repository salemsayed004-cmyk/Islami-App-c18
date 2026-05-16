import 'package:flutter/material.dart';
import 'package:islami/model/sura_data.dart';
import 'package:islami/modules/layout/quran/quran_details_view.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theme/app_colors.dart';

class SuraItem extends StatelessWidget {
  final SuraData surData;
  const SuraItem({super.key, required this.surData});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          QuranDetailsView.routeName,
          arguments: surData,
        );
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Assets.images.numberFrame.image(width: 50, height: 50),
              Text(
                surData.id,
                style: theme.textTheme.titleLarge!.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                surData.nameEn,
                style: theme.textTheme.titleLarge!.copyWith(
                  color: AppColors.white,
                ),
              ),
              Text(
                "${surData.suraAyaNumber} Verses",
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            surData.nameAr,
            style: theme.textTheme.titleLarge!.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
