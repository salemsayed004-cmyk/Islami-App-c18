class AzkarManager {
  final List<String> azkarList = [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر',
    'أستغفر الله العظيم وأتوب إليه',
    'لا حول ولا قوة إلا بالله',
    'اللهم صلِّ وسلم على نبينا محمد'
  ];

  // دالة عشان ترجع كل الأذكار
  List<String> getAllAzkar() {
    return azkarList;
  }

  // دالة عشان تختار ذكر عشوائي (مفيدة جداً لو هتعمل ودجت بتتغير)
  String getRandomZekr() {
    if (azkarList.isEmpty) return '';
    final random = DateTime.now().millisecond % azkarList.length;
    return azkarList[random];
  }

  // دالة لإضافة ذكر جديد للقائمة لو حبيت تعدل عليها برمجياً
  void addZekr(String newZekr) {
    if (newZekr.isNotEmpty) {
      azkarList.add(newZekr);
    }
  }
}