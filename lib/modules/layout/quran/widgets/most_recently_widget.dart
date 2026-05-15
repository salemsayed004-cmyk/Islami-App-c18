import 'package:flutter/material.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theme/app_colors.dart';

class MostRecentlyWidget extends StatelessWidget {
  const MostRecentlyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text("Most Recently", style: theme.textTheme.titleMedium),
        ),
        SizedBox(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  height: 145,
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          Text("Al-Anbiya", style: theme.textTheme.headlineSmall),
                          Text("الأنبياء", style: theme.textTheme.headlineSmall),
                          Text("112 Verses", style: theme.textTheme.bodyMedium),
                        ],
                      ),
                      Assets.images.imgMostRecent.image(),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 10);
              },
              itemCount: 5,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ],
    );
  }
}
