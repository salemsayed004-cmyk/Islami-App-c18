import 'package:flutter/material.dart';
import 'package:islami/modules/layout/tasbeh/azkar_list.dart';

import '../../../core/gen/assets.gen.dart';

class TasbehView extends StatefulWidget {
  const TasbehView({super.key});

  @override
  State<TasbehView> createState() => _TasbehViewState();
}

class _TasbehViewState extends State<TasbehView> {
  double angle = 0;
  int counter = 0;
  int index = 0;
  AzkarManager azkar = AzkarManager();

  void onClicked() {
    setState(() {
      angle += 20;
      counter++;

      if (counter == 33) {
        counter = 0;
        index = (index + 1) % azkar.azkarList.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.sebhaBackground.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Assets.images.imgHeader.image(),
          const SizedBox(height: 16),
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
            style: theme.textTheme.displaySmall,
          ),
          SizedBox(height: screenHeight * .09),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: onClicked,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -screenHeight * .08,
                        child: Assets.images.sebhahead.image(
                          width: screenWidth * .8,
                          height: screenHeight * .1,
                        ),
                      ),
                      Transform.rotate(
                        angle: angle * (3.141592653589793 / 180),
                        child: Assets.images.sebhabody.image(
                          height: screenHeight * .6,
                          width: screenWidth,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        azkar.azkarList[index],
                        style: theme.textTheme.displaySmall?.copyWith(
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text("$counter", style: theme.textTheme.displaySmall),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
