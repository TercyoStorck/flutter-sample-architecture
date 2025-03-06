//DOC: main class of application

import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:environment_widget/environment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_sample_architecture/application/module/modules/movie/movie.dart';
import 'package:flutter_sample_architecture/application/service/internationalization.dart';
import 'package:flutter_sample_architecture/dal/local/dal.dart';
import 'package:flutter_sample_architecture/dal/repository/repository.dart';
import 'package:flutter_sample_architecture/dal/remote/service.dart';

import 'module/modules.dart';

class Application extends StatefulWidget {
  final Environment environment;

  const Application({
    required this.environment,
  });

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final GlobalKey<NavigatorState> _globalNavigatorKey = GlobalKey<NavigatorState>();
  final _modules = Modules(
    modules: [
      MovieModule(),
    ],
    injectionGroups: [
      DalInjectionGroup(),
      RepositoryInjectionGroup(),
      ServiceInjectionGroup(),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return widget.environment.widget(
      appWidget: MaterialApp(
        navigatorKey: _globalNavigatorKey,
        theme: widget.environment.lightThemeData,
        darkTheme: widget.environment.darkThemeData,
        themeMode: EasyDynamicTheme.of(context).themeMode,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: _modules.onGenerateRoute,
        initialRoute: _modules.initialRoute,
        navigatorObservers: [_modules.routeObserver],
        supportedLocales: Internationalization.supportedLocales,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
