import 'package:flutter/material.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/screens/tabs/hadeth/hadeth_screen.dart';
import 'package:islami_app/screens/tabs/quraan/surah_screen.dart';
import 'package:islami_app/screens/tabs/tabs_screen.dart';
import 'package:islami_app/utilities/mytheme.dart';
import 'package:provider/provider.dart';

/// Localization import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfigProvider appConfigProvider = AppConfigProvider();
  await appConfigProvider.readData();
  runApp(ChangeNotifierProvider(
    create: (context) => appConfigProvider,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightMode,
      darkTheme: MyTheme.darkMode,
      themeMode: provider.appMode,
      initialRoute: TabsScreen.routeName,
      routes: {
        TabsScreen.routeName: (context) => const TabsScreen(),
        SurahScreen.routeName: (context) => const SurahScreen(),
        HadethScreen.routeName: (context) => const HadethScreen(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }
}
