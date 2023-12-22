import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:pratice_for_bloc/controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'Theme.dart';
import 'languageController.dart';

void main() {
  runApp(MyApp());
}

enum Language { english, spanish }

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageChangeController())
      ],
      child: Consumer<LanguageChangeController>(
        builder: (BuildContext context, LanguageChangeController provider,
            Widget? child) {
          return GetMaterialApp(
            title: 'Dark Mode Switch',
            theme: LightTheme.lightTheme,
            darkTheme: DarkTheme.darkTheme,
            themeMode: ThemeMode.system,
            home: MyHomePage(),
            locale: provider.appLocale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: [
              const Locale('en', 'US'), // English
              const Locale('es', 'ES'), // Spanish
              const Locale('eu', 'EU'), // Spanish
            ],
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)?.helloworld ?? 'Hello World'),
          actions: [
            Consumer<LanguageChangeController>(
              builder: (context, provider, child) {
                return PopupMenuButton(
                    onSelected: (Language item) {
                      if (Language.english.name == item.name) {
                        provider.changeLanguage(Locale('en'));
                      } else{
                        provider.changeLanguage(Locale('eu'));
                      }
                    },
                    itemBuilder: (context) => <PopupMenuEntry<Language>>[
                          PopupMenuItem(
                              value: Language.english, child: Text("English")),
                      PopupMenuItem(
                          value: Language.spanish, child: Text("Urdu")),
                        ]);
              },
            )
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              value: themeController.isDarkMode.value,
              onChanged: themeController.toggleTheme(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                themeController.toggleTheme();
              },
              child: Text('Toggle Theme'),
            ),
          ],
        )));
  }
}
