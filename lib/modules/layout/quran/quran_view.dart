import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Quran view",
        style: TextStyle(
          color: AppColors.white,
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
