import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Radio view",
        style: TextStyle(
          color: AppColors.white,
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
