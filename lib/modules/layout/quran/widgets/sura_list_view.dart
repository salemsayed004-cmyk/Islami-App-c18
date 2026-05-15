import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/model/sura_data.dart';
import 'package:islami/modules/layout/quran/widgets/sura_item.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../model/sura_data.dart';

class SuraListView extends StatefulWidget {
  const SuraListView({super.key});

  @override
  State<SuraListView> createState() => _SuraListViewState();
}

class _SuraListViewState extends State<SuraListView> {
  List<SuraData> suraDataList = [
    SuraData(
      id: '1',
      nameEn: 'Al-Fatiha',
      nameAr: 'الفاتحه',
      suraAyaNumber: '7',
    ),
    SuraData(
      id: '2',
      nameEn: 'Al-Baqarah',
      nameAr: 'البقرة',
      suraAyaNumber: '286',
    ),
    SuraData(
      id: '3',
      nameEn: 'Aal-E-Imran',
      nameAr: 'آل عمران',
      suraAyaNumber: '200',
    ),
    SuraData(
      id: '4',
      nameEn: "An-Nisa'",
      nameAr: 'النساء',
      suraAyaNumber: '176',
    ),
    SuraData(
      id: '5',
      nameEn: "Al-Ma'idah",
      nameAr: 'المائدة',
      suraAyaNumber: '120',
    ),
    SuraData(
      id: '6',
      nameEn: "Al-An'am",
      nameAr: 'الأنعام',
      suraAyaNumber: '165',
    ),
    SuraData(
      id: '7',
      nameEn: "Al-A'raf",
      nameAr: 'الأعراف',
      suraAyaNumber: '206',
    ),
    SuraData(
      id: '8',
      nameEn: 'Al-Anfal',
      nameAr: 'الأنفال',
      suraAyaNumber: '75',
    ),
    SuraData(
      id: '9',
      nameEn: 'At-Tawbah',
      nameAr: 'التوبة',
      suraAyaNumber: '129',
    ),
    SuraData(id: '10', nameEn: 'Yunus', nameAr: 'يونس', suraAyaNumber: '109'),
    SuraData(id: '11', nameEn: 'Hud', nameAr: 'هود', suraAyaNumber: '123'),
    SuraData(id: '12', nameEn: 'Yusuf', nameAr: 'يوسف', suraAyaNumber: '111'),
    SuraData(id: '13', nameEn: "Ar-Ra'd", nameAr: 'الرعد', suraAyaNumber: '43'),
    SuraData(
      id: '14',
      nameEn: 'Ibrahim',
      nameAr: 'إبراهيم',
      suraAyaNumber: '52',
    ),
    SuraData(id: '15', nameEn: 'Al-Hijr', nameAr: 'الحجر', suraAyaNumber: '99'),
    SuraData(
      id: '16',
      nameEn: 'An-Nahl',
      nameAr: 'النحل',
      suraAyaNumber: '128',
    ),
    SuraData(
      id: '17',
      nameEn: 'Al-Isra',
      nameAr: 'الإسراء',
      suraAyaNumber: '111',
    ),
    SuraData(
      id: '18',
      nameEn: 'Al-Kahf',
      nameAr: 'الكهف',
      suraAyaNumber: '110',
    ),
    SuraData(id: '19', nameEn: 'Maryam', nameAr: 'مريم', suraAyaNumber: '98'),
    SuraData(id: '20', nameEn: 'Ta-Ha', nameAr: 'طه', suraAyaNumber: '135'),
    SuraData(
      id: '21',
      nameEn: 'Al-Anbiya',
      nameAr: 'الأنبياء',
      suraAyaNumber: '112',
    ),
    SuraData(id: '22', nameEn: 'Al-Hajj', nameAr: 'الحج', suraAyaNumber: '78'),
    SuraData(
      id: '23',
      nameEn: "Al-Mu'minun",
      nameAr: 'المؤمنون',
      suraAyaNumber: '118',
    ),
    SuraData(id: '24', nameEn: 'An-Nur', nameAr: 'النّور', suraAyaNumber: '64'),
    SuraData(
      id: '25',
      nameEn: 'Al-Furqan',
      nameAr: 'الفرقان',
      suraAyaNumber: '77',
    ),
    SuraData(
      id: '26',
      nameEn: "Ash-Shu'ara",
      nameAr: 'الشعراء',
      suraAyaNumber: '227',
    ),
    SuraData(
      id: '27',
      nameEn: 'An-Naml',
      nameAr: 'النّمل',
      suraAyaNumber: '93',
    ),
    SuraData(
      id: '28',
      nameEn: 'Al-Qasas',
      nameAr: 'القصص',
      suraAyaNumber: '88',
    ),
    SuraData(
      id: '29',
      nameEn: 'Al-Ankabut',
      nameAr: 'العنكبوت',
      suraAyaNumber: '69',
    ),
    SuraData(id: '30', nameEn: 'Ar-Rum', nameAr: 'الرّوم', suraAyaNumber: '60'),
    SuraData(id: '31', nameEn: 'Luqman', nameAr: 'لقمان', suraAyaNumber: '34'),
    SuraData(
      id: '32',
      nameEn: 'As-Sajda',
      nameAr: 'السجدة',
      suraAyaNumber: '30',
    ),
    SuraData(
      id: '33',
      nameEn: 'Al-Ahzab',
      nameAr: 'الأحزاب',
      suraAyaNumber: '73',
    ),
    SuraData(id: '34', nameEn: 'Saba', nameAr: 'سبأ', suraAyaNumber: '54'),
    SuraData(id: '35', nameEn: 'Fatir', nameAr: 'فاطر', suraAyaNumber: '45'),
    SuraData(id: '36', nameEn: 'Ya-Sin', nameAr: 'يس', suraAyaNumber: '83'),
    SuraData(
      id: '37',
      nameEn: 'As-Saffat',
      nameAr: 'الصافات',
      suraAyaNumber: '182',
    ),
    SuraData(id: '38', nameEn: 'Sad', nameAr: 'ص', suraAyaNumber: '88'),
    SuraData(
      id: '39',
      nameEn: 'Az-Zumar',
      nameAr: 'الزمر',
      suraAyaNumber: '75',
    ),
    SuraData(id: '40', nameEn: 'Ghafir', nameAr: 'غافر', suraAyaNumber: '85'),
    SuraData(
      id: '41',
      nameEn: 'Fussilat',
      nameAr: 'فصّلت',
      suraAyaNumber: '54',
    ),
    SuraData(
      id: '42',
      nameEn: 'Ash-Shura',
      nameAr: 'الشورى',
      suraAyaNumber: '53',
    ),
    SuraData(
      id: '43',
      nameEn: 'Az-Zukhruf',
      nameAr: 'الزخرف',
      suraAyaNumber: '89',
    ),
    SuraData(
      id: '44',
      nameEn: 'Ad-Dukhan',
      nameAr: 'الدّخان',
      suraAyaNumber: '59',
    ),
    SuraData(
      id: '45',
      nameEn: 'Al-Jathiya',
      nameAr: 'الجاثية',
      suraAyaNumber: '37',
    ),
    SuraData(
      id: '46',
      nameEn: 'Al-Ahqaf',
      nameAr: 'الأحقاف',
      suraAyaNumber: '35',
    ),
    SuraData(id: '47', nameEn: 'Muhammad', nameAr: 'محمد', suraAyaNumber: '38'),
    SuraData(id: '48', nameEn: 'Al-Fath', nameAr: 'الفتح', suraAyaNumber: '29'),
    SuraData(
      id: '49',
      nameEn: 'Al-Hujurat',
      nameAr: 'الحجرات',
      suraAyaNumber: '18',
    ),
    SuraData(id: '50', nameEn: 'Qaf', nameAr: 'ق', suraAyaNumber: '45'),
    SuraData(
      id: '51',
      nameEn: 'Adh-Dhariyat',
      nameAr: 'الذاريات',
      suraAyaNumber: '60',
    ),
    SuraData(id: '52', nameEn: 'At-Tur', nameAr: 'الطور', suraAyaNumber: '49'),
    SuraData(id: '53', nameEn: 'An-Najm', nameAr: 'النجم', suraAyaNumber: '62'),
    SuraData(
      id: '54',
      nameEn: 'Al-Qamar',
      nameAr: 'القمر',
      suraAyaNumber: '55',
    ),
    SuraData(
      id: '55',
      nameEn: 'Ar-Rahman',
      nameAr: 'الرحمن',
      suraAyaNumber: '78',
    ),
    SuraData(
      id: '56',
      nameEn: "Al-Waqi'a",
      nameAr: 'الواقعة',
      suraAyaNumber: '96',
    ),
    SuraData(
      id: '57',
      nameEn: 'Al-Hadid',
      nameAr: 'الحديد',
      suraAyaNumber: '29',
    ),
    SuraData(
      id: '58',
      nameEn: 'Al-Mujadila',
      nameAr: 'المجادلة',
      suraAyaNumber: '22',
    ),
    SuraData(
      id: '59',
      nameEn: 'Al-Hashr',
      nameAr: 'الحشر',
      suraAyaNumber: '24',
    ),
    SuraData(
      id: '60',
      nameEn: 'Al-Mumtahina',
      nameAr: 'الممتحنة',
      suraAyaNumber: '13',
    ),
    SuraData(id: '61', nameEn: 'As-Saff', nameAr: 'الصف', suraAyaNumber: '14'),
    SuraData(
      id: '62',
      nameEn: "Al-Jumu'a",
      nameAr: 'الجمعة',
      suraAyaNumber: '11',
    ),
    SuraData(
      id: '63',
      nameEn: 'Al-Munafiqun',
      nameAr: 'المنافقون',
      suraAyaNumber: '11',
    ),
    SuraData(
      id: '64',
      nameEn: 'At-Taghabun',
      nameAr: 'التغابن',
      suraAyaNumber: '18',
    ),
    SuraData(
      id: '65',
      nameEn: 'At-Talaq',
      nameAr: 'الطلاق',
      suraAyaNumber: '12',
    ),
    SuraData(
      id: '66',
      nameEn: 'At-Tahrim',
      nameAr: 'التحريم',
      suraAyaNumber: '12',
    ),
    SuraData(id: '67', nameEn: 'Al-Mulk', nameAr: 'الملك', suraAyaNumber: '30'),
    SuraData(
      id: '68',
      nameEn: 'Al-Qalam',
      nameAr: 'القلم',
      suraAyaNumber: '52',
    ),
    SuraData(
      id: '69',
      nameEn: 'Al-Haqqah',
      nameAr: 'الحاقة',
      suraAyaNumber: '52',
    ),
    SuraData(
      id: '70',
      nameEn: "Al-Ma'arij",
      nameAr: 'المعارج',
      suraAyaNumber: '44',
    ),
    SuraData(id: '71', nameEn: 'Nuh', nameAr: 'نوح', suraAyaNumber: '28'),
    SuraData(id: '72', nameEn: 'Al-Jinn', nameAr: 'الجن', suraAyaNumber: '28'),
    SuraData(
      id: '73',
      nameEn: 'Al-Muzzammil',
      nameAr: 'المزّمّل',
      suraAyaNumber: '20',
    ),
    SuraData(
      id: '74',
      nameEn: 'Al-Muddathir',
      nameAr: 'المدّثر',
      suraAyaNumber: '56',
    ),
    SuraData(
      id: '75',
      nameEn: 'Al-Qiyamah',
      nameAr: 'القيامة',
      suraAyaNumber: '40',
    ),
    SuraData(
      id: '76',
      nameEn: 'Al-Insan',
      nameAr: 'الإنسان',
      suraAyaNumber: '31',
    ),
    SuraData(
      id: '77',
      nameEn: 'Al-Mursalat',
      nameAr: 'المرسلات',
      suraAyaNumber: '50',
    ),
    SuraData(
      id: '78',
      nameEn: "An-Naba'",
      nameAr: 'النبأ',
      suraAyaNumber: '40',
    ),
    SuraData(
      id: '79',
      nameEn: "An-Nazi'at",
      nameAr: 'النازعات',
      suraAyaNumber: '46',
    ),
    SuraData(id: '80', nameEn: 'Abasa', nameAr: 'عبس', suraAyaNumber: '42'),
    SuraData(
      id: '81',
      nameEn: 'At-Takwir',
      nameAr: 'التكوير',
      suraAyaNumber: '29',
    ),
    SuraData(
      id: '82',
      nameEn: 'Al-Infitar',
      nameAr: 'الإنفطار',
      suraAyaNumber: '19',
    ),
    SuraData(
      id: '83',
      nameEn: 'Al-Mutaffifin',
      nameAr: 'المطفّفين',
      suraAyaNumber: '36',
    ),
    SuraData(
      id: '84',
      nameEn: 'Al-Inshiqaq',
      nameAr: 'الإنشقاق',
      suraAyaNumber: '25',
    ),
    SuraData(
      id: '85',
      nameEn: 'Al-Buruj',
      nameAr: 'البروج',
      suraAyaNumber: '22',
    ),
    SuraData(
      id: '86',
      nameEn: 'At-Tariq',
      nameAr: 'الطارق',
      suraAyaNumber: '17',
    ),
    SuraData(
      id: '87',
      nameEn: "Al-A'la",
      nameAr: 'الأعلى',
      suraAyaNumber: '19',
    ),
    SuraData(
      id: '88',
      nameEn: 'Al-Ghashiyah',
      nameAr: 'الغاشية',
      suraAyaNumber: '26',
    ),
    SuraData(id: '89', nameEn: 'Al-Fajr', nameAr: 'الفجر', suraAyaNumber: '30'),
    SuraData(
      id: '90',
      nameEn: 'Al-Balad',
      nameAr: 'البلد',
      suraAyaNumber: '20',
    ),
    SuraData(
      id: '91',
      nameEn: 'Ash-Shams',
      nameAr: 'الشمس',
      suraAyaNumber: '15',
    ),
    SuraData(id: '92', nameEn: 'Al-Lail', nameAr: 'الليل', suraAyaNumber: '21'),
    SuraData(id: '93', nameEn: 'Ad-Duha', nameAr: 'الضحى', suraAyaNumber: '11'),
    SuraData(
      id: '94',
      nameEn: 'Ash-Sharh',
      nameAr: 'الشرح',
      suraAyaNumber: '8',
    ),
    SuraData(id: '95', nameEn: 'At-Tin', nameAr: 'التين', suraAyaNumber: '8'),
    SuraData(id: '96', nameEn: 'Al-Alaq', nameAr: 'العلق', suraAyaNumber: '19'),
    SuraData(id: '97', nameEn: 'Al-Qadr', nameAr: 'القدر', suraAyaNumber: '5'),
    SuraData(
      id: '98',
      nameEn: 'Al-Bayyina',
      nameAr: 'البينة',
      suraAyaNumber: '8',
    ),
    SuraData(
      id: '99',
      nameEn: 'Az-Zalzalah',
      nameAr: 'الزلزلة',
      suraAyaNumber: '8',
    ),
    SuraData(
      id: '100',
      nameEn: 'Al-Adiyat',
      nameAr: 'العاديات',
      suraAyaNumber: '11',
    ),
    SuraData(
      id: '101',
      nameEn: "Al-Qari'a",
      nameAr: 'القارعة',
      suraAyaNumber: '11',
    ),
    SuraData(
      id: '102',
      nameEn: 'At-Takathur',
      nameAr: 'التكاثر',
      suraAyaNumber: '8',
    ),
    SuraData(id: '103', nameEn: 'Al-Asr', nameAr: 'العصر', suraAyaNumber: '3'),
    SuraData(
      id: '104',
      nameEn: 'Al-Humazah',
      nameAr: 'الهمزة',
      suraAyaNumber: '9',
    ),
    SuraData(id: '105', nameEn: 'Al-Fil', nameAr: 'الفيل', suraAyaNumber: '5'),
    SuraData(id: '106', nameEn: 'Quraysh', nameAr: 'قريش', suraAyaNumber: '4'),
    SuraData(
      id: '107',
      nameEn: "Al-Ma'un",
      nameAr: 'الماعون',
      suraAyaNumber: '6',
    ),
    SuraData(
      id: '108',
      nameEn: 'Al-Kawthar',
      nameAr: 'الكوثر',
      suraAyaNumber: '3',
    ),
    SuraData(
      id: '109',
      nameEn: 'Al-Kafirun',
      nameAr: 'الكافرون',
      suraAyaNumber: '6',
    ),
    SuraData(id: '110', nameEn: 'An-Nasr', nameAr: 'النصر', suraAyaNumber: '3'),
    SuraData(
      id: '111',
      nameEn: 'Al-Masad',
      nameAr: 'المسد',
      suraAyaNumber: '5',
    ),
    SuraData(
      id: '112',
      nameEn: 'Al-Ikhlas',
      nameAr: 'الإخلاص',
      suraAyaNumber: '4',
    ),
    SuraData(
      id: '113',
      nameEn: 'Al-Falaq',
      nameAr: 'الفلق',
      suraAyaNumber: '5',
    ),
    SuraData(id: '114', nameEn: 'An-Nas', nameAr: 'الناس', suraAyaNumber: '6'),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Suras List", style: theme.textTheme.titleMedium),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return SuraItem(surData: suraDataList[index]);
            },
            separatorBuilder: (context, index) {
              return Divider(color: AppColors.white, endIndent: 40, indent: 40);
            },
            itemCount: suraDataList.length,
          ),
        ],
      ),
    );
  }
}
