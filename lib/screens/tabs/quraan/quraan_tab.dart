import 'package:flutter/material.dart';
import 'package:islami_app/screens/tabs/quraan/models/surah.dart';
import 'package:islami_app/screens/tabs/quraan/surah_screen.dart';

/// Localization import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuraanTab extends StatelessWidget {
  QuraanTab({super.key});

  /// [ MARK ] Variables:
  final List<String> _surahNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  /// [ MARK ] Utilities:

  /// [ MARK ] STF LifeCycle:
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset("assets/images/qur2an_screen_logo.png")),
        const Divider(
          thickness: 2,
        ),
        Text(
          AppLocalizations.of(context)!.surah_name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Divider(
          thickness: 2,
        ),
        Expanded(
          child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                    thickness: 0.2,
                  ),
              itemCount: _surahNames.length,
              itemBuilder: (context, i) {
                return InkWell(
                  overlayColor:
                      //* TODOO : change the splashColor with overlay
                      const MaterialStatePropertyAll(Colors.transparent),
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    Navigator.of(context).pushNamed(SurahScreen.routeName,
                        arguments: Surah(name: _surahNames[i], index: i));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      _surahNames[i],
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
