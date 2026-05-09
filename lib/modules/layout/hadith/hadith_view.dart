import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class HadithView extends StatelessWidget {
  const HadithView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Hadith view",
        style: TextStyle(
          color: AppColors.white,
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
