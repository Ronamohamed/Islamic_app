import 'package:flutter/material.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/screens/tabs/sebha/widgets/sebha_stack.dart';

// Localization import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/utilities/mytheme.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({Key? key}) : super(key: key);

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int _counter = 0;
  int _currentAzkarIndex = 0;
  double _turns = 0.0;

  final List<String> _azkar = [
    "سبحان الله",
    "الحمدلله",
    "لا اله إلا الله",
    "الله أكبر",
    "لا حول ولا قوة إلا بالله"
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter == 34) {
        _counter = 0;
        _currentAzkarIndex = (_currentAzkarIndex + 1) % _azkar.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sebha'),
      ),
      body: Center( // Center the content vertically
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center the column content vertically
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: GestureDetector(
                    onTap: () {
                      _incrementCounter();
                      _turns += 0.03;
                      setState(() {});
                    },
                    child: SebhaStack(turns: _turns),
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.tasbeh_count,
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  width: 69,
                  height: 81,
                  decoration: BoxDecoration(
                    color: (provider.isDarkMode(provider.appMode)
                        ? Theme.of(context).primaryColor
                        : const Color(0xffcab497)),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    "$_counter",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontSize: 22),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  decoration: BoxDecoration(
                    color: (provider.isDarkMode(provider.appMode))
                        ? MyTheme.yellowColor
                        : Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: Text(
                    _azkar[_currentAzkarIndex],
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
