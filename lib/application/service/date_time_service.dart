import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

String get locale {
  final currentLocale = WidgetsBinding.instance.platformDispatcher.locale;
  final localeString = "${currentLocale.languageCode}_${currentLocale.countryCode}";
  return localeString;
}

String mMMdyHm(DateTime? value) {
  if (value == null) {
    return '';
  }

  return DateFormat.MMMd(locale).add_y().add_Hm().format(value);
}

String yMdHm(DateTime? value) {
  if (value == null) {
    return '';
  }

  return DateFormat.yMd(locale).add_Hm().format(value);
}

String ddMMyyyy(DateTime? value, {String? emptyDateMessage}) {
  if (value == null) {
    return emptyDateMessage ?? '';
  }

  return DateFormat.yMd(locale).format(value);
}

String ddMM(DateTime? value) {
  if (value == null) {
    return '';
  }

  return DateFormat.Md(locale).format(value);
}

String hm(DateTime? value) {
  if (value == null) {
    return '';
  }

  return DateFormat.Hm(locale).format(value);
}
