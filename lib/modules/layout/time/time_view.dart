import 'package:flutter/material.dart';

import '../../../core/gen/assets.gen.dart';

class TimeView extends StatelessWidget {
  const TimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.timeBackground.provider(),
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
