import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:environment_widget/environment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_architecture/application/application.dart';
import 'package:flutter_sample_architecture/dal/local/hive/dao/dao.dart' as hive;

Future<EasyDynamicThemeWidget> run({
  required Environment environment,
  required Map<String, dynamic> environmentConstants,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await hive.DAO.initDatabase();

  return EasyDynamicThemeWidget(
    initialThemeMode: ThemeMode.light,
    child: Application(
      environment: environment,
    ),
  );
}
