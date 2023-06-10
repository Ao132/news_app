import 'package:news_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:news_app/List_provider.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/settings/settings_tab.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => ListProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  late ListProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ListProvider>(context);
    initSharedPref();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SettingsTab.routeName: (context) => const SettingsTab(),
      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLang),
    );
  }

  initSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString('lang') ?? 'en';
    provider.changeAppLang(lang);
  }
}
