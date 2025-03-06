import 'package:environment_widget/environment_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_sample_architecture/application/schema/default/theme/theme.dart' as themes;
import 'package:flutter_sample_architecture/main.dart' as program;

void main() async {
  final applicationWidget = await program.run(
    environment: Environment(
      bannerColor: Colors.purple,
      bannerTag: 'Hmg',
      lightThemeData: themes.lightThemeData,
      darkThemeData: themes.darkThemeData,
    ),
    environmentConstants: {},
  );

  runApp(applicationWidget);
}
