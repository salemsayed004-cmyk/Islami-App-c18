
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/hadith_data.dart';
import 'package:islami/modules/layout/hadith/wedgets/hadith_item.dart';
import '../../../core/gen/assets.gen.dart';

class HadithView extends StatefulWidget {
  const HadithView({super.key});

  @override
  State<HadithView> createState() => _HadithViewState();
}

class _HadithViewState extends State<HadithView> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery
        .of(context)
        .size;

    lodeHadithData();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.hadethBackground.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Assets.images.imgHeader.image(),
          CarouselSlider(
            items: hadithDataList.map((e) {
              return HadithItem(data: e);
            },).toList(),
            options: CarouselOptions(
              height: mediaQuery.height * 0.6,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              // onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
  List<HadithData> hadithDataList = [];

  Future<void> lodeHadithData() async {
    for (int i = 1; i <= 50; i++) {
      String content = await rootBundle.loadString(
        "assets/files/hadith/h$i.txt",
      );
      int titleLength = content.trim().indexOf("\n");
      String title = content.substring(0, titleLength);
      String desc = content.substring(titleLength + 1);
      final data = HadithData(hadithTitle: title, hadithDesc: desc);
      hadithDataList.add(data);
    }
    setState(() {

    });
  }

}







