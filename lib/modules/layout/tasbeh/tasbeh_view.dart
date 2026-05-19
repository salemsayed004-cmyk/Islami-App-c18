import 'package:flutter/material.dart';

import '../../../core/gen/assets.gen.dart';

class TasbehView extends StatelessWidget {
  const TasbehView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.sebhaBackground.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(children: [Assets.images.imgHeader.image()]),
    );
  }
}
