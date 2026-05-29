import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/gen/assets.gen.dart';
import 'package:intl/intl.dart';
import 'cubit/prayer_time_cubit.dart';
import 'cubit/prayer_time_state.dart';

class TimeView extends StatelessWidget {
  static const String routeName = '/time';

  const TimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // خلفية الشاشة الكاملة
          Assets.images.splashBackground.image(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
            builder: (context, state) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 16),
                      // الـ Logo الرئيسي للأبلكيشن فوق
                      Assets.images.imgHeader.image(height: 120),
                      const SizedBox(height: 16),

                      // كارت مواقيت الصلاة بتوزيعه الهندسي المظبوط
                      PrayerTimeMainCard(state: state),
                      const SizedBox(height: 24),

                      // عنوان قسم الأذكار
                      const Text(
                        "Azkar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // كروت الأذكار الرأسية (الواقفة) بالـ Assets الأصلية
                      const AzkarSection(),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// =========================================================================
// الكارت الرئيسي لمواقيت الصلاة - متناسق مع منحنيات صورة الـ Background
// =========================================================================
class PrayerTimeMainCard extends StatelessWidget {
  final PrayerTimeState state;

  const PrayerTimeMainCard({super.key, required this.state});

  String getFormattedTimeDigits(DateTime time) {
    return DateFormat('hh:mm').format(time);
  }

  String getFormattedTimePeriod(DateTime time) {
    return DateFormat('a').format(time);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Assets.images.rectangle138.image(
          width: 390,
          height: 280,
          fit: BoxFit.fill,
        ),

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.group35.path),
              fit: BoxFit.fill,
            ),
          ),
          // Padding مدروس ومحسوب بالـ pixels عشان نمنع النصوص تخرج برا المنحنيات
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 20,

          ),
          child: Column(
            children: [
              // الهيكل العلوي (الكتف الشمال، القبة في النص، الكتف اليمين)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // الكتف الشمال: التاريخ الميلادي
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        state.gregorianDate, // "16 Jul, 2024"
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  // القبة في المنتصف: كلمة Pray Time وتحتها اليوم
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        const Text(
                          "Pray Time",
                          style: TextStyle(
                            color: Color(0xFF4E3629),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          state.dayName, // "Tuesday"
                          style: const TextStyle(
                            color: Color(0xFF4E3629),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // الكتف اليمين: التاريخ الهجري
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        state.hijriDate, // "09 Muh, 1446"
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // قائمة مواقيت الصلاة الأفقية (كروت داكنة مستديرة الزوايا)
              SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),


                  children: [
                    _buildPrayerCard(
                      "Fajr",
                      state.prayerTimes.fajr,
                      state.nextPrayer.name == 'fajr',
                    ),
                    _buildPrayerCard(
                      "Dhuhr",
                      state.prayerTimes.dhuhr,
                      state.nextPrayer.name == 'dhuhr',
                    ),
                    _buildPrayerCard(
                      "Asr",
                      state.prayerTimes.asr,
                      state.nextPrayer.name == 'asr',
                    ),
                    _buildPrayerCard(
                      "Maghrib",
                      state.prayerTimes.maghrib,
                      state.nextPrayer.name == 'maghrib',
                    ),
                    _buildPrayerCard(
                      "Isha",
                      state.prayerTimes.isha,
                      state.nextPrayer.name == 'isha',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // السطر السفلي الحاضن للـ Remaining Time وأيقونة الـ Mute
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 24),
                    Text(
                      "Next Pray - ${state.remainingTime}",
                      style: const TextStyle(
                        color: Color(0xFF4E3629),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      Icons.volume_off_rounded,
                      color: Color(0xFF4E3629),
                      size: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // كارت الصلاة الداكن بحواف دائرية ليتطابق مع التصميم الجديد
  Widget _buildPrayerCard(String label, DateTime prayerTime, bool isNext) {
    final digits = getFormattedTimeDigits(prayerTime);
    final period = getFormattedTimePeriod(prayerTime);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: isNext
          ? 100
          : 85, // الصلاة النشطة بتكبر شوية تلقائياً لتبرز للمستخدم
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(
          0xFF202020,
        ).withValues(alpha: 0.75), // لون زيتي داكن شفاف متناسق مع الهوية
        borderRadius: BorderRadius.circular(20),
        border: isNext ? Border.all(color: AppColors.gold, width: 2) : null,
        boxShadow: isNext
            ? [
                BoxShadow(
                  color: AppColors.gold.withValues(alpha: 0.3),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ]
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isNext ? AppColors.gold : Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            digits,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),
          Text(
            period,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// =========================================================================
// قسم كروت الأذكار الرأسية (Vertical Cards) الثابتة بدون Navigation
// =========================================================================
class AzkarSection extends StatelessWidget {
  const AzkarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildVerticalAzkarItem(
          title: "Evening Azkar",
          imageWidget: Assets.images.bellIcon1.image(fit: BoxFit.contain),
        ),
        const SizedBox(width: 16),
        _buildVerticalAzkarItem(
          title: "Morning Azkar",
          imageWidget: Assets.images.commentBubbleIcon1.image(
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalAzkarItem({
    required String title,
    required Widget imageWidget,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppColors.gold.withValues(alpha: 0.6),
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // مساحة مخصصة للـ 3D Asset لضمان عدم حدوث Overflow للـ Image
            SizedBox(height: 140, child: imageWidget),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
