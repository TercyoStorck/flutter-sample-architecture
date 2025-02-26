import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:environment_widget/environment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_architecture/application/application.dart';

Future<EasyDynamicThemeWidget> run({
  required Environment environment,
  required Map<String, dynamic> environmentConstants,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  return EasyDynamicThemeWidget(
    initialThemeMode: ThemeMode.dark,
    child: Application(
      environment: environment,
    ),
  );
}
