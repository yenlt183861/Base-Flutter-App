import 'package:base_flutter_app/generated/l10n.dart';
import 'package:base_flutter_app/src/configs/resources/barrel_resources.dart';
import 'package:base_flutter_app/src/widgets/bottom_navigation/default_bottom_nav_with_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        if (supportedLocales.map((e) => e.languageCode).contains(deviceLocale?.languageCode)) {
          return deviceLocale;
        } else {
          return const Locale('en', '');
        }
      },
      onGenerateRoute: AppRouter.onGenerateRoute,
      // initialRoute: AppRouter.HOME_SCREEN,
      home: CustomBottomNavWithFABExample(
        fabLocation: FABLocation.center,
      ),
      // app theme
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.dark,
      theme: AppTheme.light,
    );
  }
}
