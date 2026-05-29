import 'package:adhan/adhan.dart';

class PrayerTimeState {
  final PrayerTimes prayerTimes;
  final Prayer nextPrayer;
  final String remainingTime;
  final String gregorianDate;
  final String hijriDate;
  final String dayName;

  PrayerTimeState({
    required this.prayerTimes,
    required this.nextPrayer,
    required this.remainingTime,
    required this.gregorianDate,
    required this.hijriDate,
    required this.dayName,
  });
}