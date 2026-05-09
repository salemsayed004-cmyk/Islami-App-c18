import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class TimeView extends StatelessWidget {
  const TimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Time view",
        style: TextStyle(
          color: AppColors.white,
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
