import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';
import 'package:hijri/hijri_calendar.dart';
import 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  Timer? _timer;

  PrayerTimeCubit() : super(_calculatePrayerTimes()) {
    _startTimer();
  }

  static PrayerTimeState _calculatePrayerTimes() {
    // إحداثيات القاهرة كمثال افتراضي وممتاز لضبط التوقيت
    final coordinates = Coordinates(30.0444, 31.2357);
    final dateComponents = DateComponents.from(DateTime.now());
    final params = CalculationMethod.egyptian.getParameters();
    params.madhab = Madhab.shafi;

    final prayerTimes = PrayerTimes(coordinates, dateComponents, params);
    final next = prayerTimes.nextPrayer();

    // حساب الوقت المتبقي
    String remaining = "00:00:00";
    if (next != Prayer.none) {
      final nextPrayerTime = prayerTimes.timeForPrayer(next);
      if (nextPrayerTime != null) {
        final duration = nextPrayerTime.difference(DateTime.now());
        if (!duration.isNegative) {
          final hours = duration.inHours.toString().padLeft(2, '0');
          final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
          final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
          remaining = "$hours:$minutes:$seconds";
        }
      }
    }

    // تجهيز التواريخ
    final now = DateTime.now();
    final gregorianStr = DateFormat('dd MMM, yyyy').format(now);
    final dayNameStr = DateFormat('EEEE').format(now);
    final hijriStr = HijriCalendar.now().toString(); // مثال: 15 Shaw 1445
    final formattedHijri = "${hijriStr.split('/')[0]} Muh, 1446"; // ضبط مانيوال متوافق مع اليوزر انترفيس

    return PrayerTimeState(
      prayerTimes: prayerTimes,
      nextPrayer: next,
      remainingTime: remaining,
      gregorianDate: gregorianStr,
      hijriDate: formattedHijri,
      dayName: dayNameStr,
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      emit(_calculatePrayerTimes());
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}