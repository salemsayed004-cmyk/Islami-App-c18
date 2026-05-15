import 'package:flutter/material.dart';

import '../../../core/gen/assets.gen.dart';
import '../../../core/theme/app_colors.dart';

class HadithView extends StatelessWidget {
  const HadithView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.hadethBackground.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Assets.images.imgHeader.image(),
        ],
      ),
    );
  }
}
