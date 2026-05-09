import 'package:flutter/material.dart';
import 'package:islami/modules/layout/quran/quran_view.dart';
import 'package:islami/modules/layout/radio/radio_view.dart';
import 'package:islami/modules/layout/tasbeh/tasbeh_view.dart';
import 'package:islami/modules/layout/time/time_view.dart';

import '../../core/gen/assets.gen.dart';
import '../../core/theme/app_colors.dart';
import 'hadith/hadith_view.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = '/layout';
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _selectedIndex = 0;
  List<Widget> screens = [
    QuranView(),
    HadithView(),
    TasbehView(),
    RadioView(),
    TimeView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: Assets.icons.icQuran.svg(width: 22, height: 22),
            activeIcon: Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 22),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Assets.icons.icQuran.svg(
                width: 22,
                height: 22,
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
            ),
            label: "Quran",
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.icHadeth.svg(width: 22, height: 22),
            activeIcon: Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 22),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Assets.icons.icHadeth.svg(
                width: 22,
                height: 22,
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
            ),
            label: "Hadeth",
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.icSebha.svg(width: 22, height: 22),
            activeIcon: Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 22),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(40),
              ),

              child: Assets.icons.icSebha.svg(
                width: 22,
                height: 22,
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
            ),
            label: "Tasbih",
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.icRadio.svg(width: 22, height: 22),
            activeIcon: Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 22),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Assets.icons.icRadio.svg(
                width: 22,
                height: 22,
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
            ),
            label: "Radio",
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.icTime.svg(width: 22, height: 22),
            activeIcon: Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 22),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Assets.icons.icTime.svg(
                width: 22,
                height: 22,
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
            ),
            label: "Time",
          ),
        ],
      ),
    );
  }
}
