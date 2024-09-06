import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'generated/l10n.dart';
import 'src/my_app.dart';

late String apiKey;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String languageCode = 'en';
  String countryCode = '';
  if (!kIsWeb) {
    final localeName = Platform.localeName.split('_');
    languageCode = localeName[0];
    try {
      countryCode = localeName[1];
    } catch (_) {}
  }
  await S.load(Locale(languageCode, countryCode));
  runApp(const MyApp());
}
