import 'package:flutter/material.dart';

import '../../../core/gen/assets.gen.dart';

class TasbehView extends StatelessWidget {
  const TasbehView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.sebhaBackground.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(children: [Assets.images.imgHeader.image(),
      SizedBox(height: 16),
      Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ",style: theme.textTheme.displaySmall,),
        Stack(
          children: [
            Column(
              children: [
                Positioned(

                  top: 379 ,left: 26 ,child: Assets.images.sebhahead.image(height: 86,width: 145)),
                Transform.rotate(angle: -30,
                child: Positioned(top: 300,left: 143 ,child: Assets.images.sebhabody.image(height: 380,width: 378))),


              ],

            ),
          ],
        )
      ]),
    );
  }
}
