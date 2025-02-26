import 'package:flutter/widgets.dart';

class Internationalization {
  static String get translationsPath => "assets/translations/";
  static Locale get defaltLocale => const Locale('pt');
  static List<Locale> get supportedLocales => [
        Internationalization.defaltLocale,
        const Locale('en'),
        const Locale('es'),
      ];
}
