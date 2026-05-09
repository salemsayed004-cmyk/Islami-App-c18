import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class TasbehView extends StatelessWidget {
  const TasbehView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Tasbeh view",
        style: TextStyle(
          color: AppColors.white,
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
