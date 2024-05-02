import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/screens/tabs/quraan/models/surah.dart';
import 'package:islami_app/screens/tabs/quraan/widgets/content_card.dart';

/// Localization import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SurahScreen extends StatefulWidget {
  static const String routeName = "surah_screen";

  const SurahScreen({super.key});

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  /// [ MARK ] Variables:
  List<String> _ayat = [];

  /// [ MARK ] Utilities:
  Future<void> loadFile(int index) async {
    String content =
        await rootBundle.loadString("assets/files/quraan/${index + 1}.txt");
    List<String> lines = content.split('\n');

    _ayat = lines;
    setState(() {});
  }

  /// [ MARK ] STF LifeCycle:
  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as Surah;
    if (_ayat.isEmpty) {
      loadFile(arg.index);
    }
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(children: [
      Image.asset(
        provider.isDarkMode(provider.appMode)
            ? "assets/images/dark_bg.png"
            : "assets/images/default_bg.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.app_title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: _ayat.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ContentCard(
                name: "سورة ${arg.name}",
                itemCount: _ayat.length,
                itemBuilder: ((context, i) => Text(
                      "${_ayat[i]}☽${(i + 1)}☾",
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center,
                    ))),
      )
    ]);
  }
}
