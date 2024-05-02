import 'package:flutter/material.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/screens/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_app/screens/tabs/quraan/quraan_tab.dart';
import 'package:islami_app/screens/tabs/radio/radio_tab.dart';
import 'package:islami_app/screens/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/screens/tabs/settings/settings_tab.dart';
import 'package:islami_app/screens/tabs/widgets/app_navbar.dart';

/// Localization import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatefulWidget {
  static const String routeName = "tabs_screen";

  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedTabIndex = 0;
  final List<Widget> _tabs = [
    QuraanTab(),
    const HadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const SettingsTab()
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Stack(
      children: [
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
          bottomNavigationBar: AppBottomNavigationBar(
              currenIndex: _selectedTabIndex,
              onTap: (newIndex) {
                setState(() {
                  _selectedTabIndex = newIndex;
                });
              }),
          body: _tabs[_selectedTabIndex],
        )
      ],
    );
  }
}
