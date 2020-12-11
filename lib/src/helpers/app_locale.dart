import 'dart:ui' show Locale;

class AppLocale {

  static const englishLocale = Locale('en', 'US');
  static final englishLocaleString = '${englishLocale.languageCode}_${englishLocale.countryCode}';
}
