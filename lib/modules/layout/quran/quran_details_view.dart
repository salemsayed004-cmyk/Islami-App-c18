import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/model/sura_data.dart';

import '../../../core/gen/assets.gen.dart';

class QuranDetailsView extends StatefulWidget {
  static const String routeName = '/quran_details_view';
  const QuranDetailsView({super.key});

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SuraData;
    final ThemeData theme = Theme.of(context);
    if(verse.isEmpty) readData(args.id);
    return Scaffold(
      appBar: AppBar(title: Text(args.nameEn)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Assets.images.imgLeftCorner.image(width: 93, height: 92),
                Text(
                  args.nameAr,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: AppColors.gold,
                  ),
                ),
                Assets.images.imgRightCorner.image(width: 93, height: 92),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: verse.length,
              itemBuilder: (context, index) {
                return Text(
                  "${[index +1]}${verse[index]}",
                  textAlign: TextAlign.center,

                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: AppColors.gold,height: 1.7),

                );
              },
            ),
          ),
          Assets.images.imgBottomDecoration.image(),
        ],
      ),
    );
  }

  List<String> verse = [];

  Future<void> readData(String suraNumber) async {
    String content = await rootBundle.loadString("assets/files/$suraNumber.txt");
    setState(() {
    verse = content.split('\n');
    });
  }
}
