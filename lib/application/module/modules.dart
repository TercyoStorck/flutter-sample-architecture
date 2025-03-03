import 'package:depin/depin.dart';
import 'package:modular_router/modular_router.dart';

import 'modules/movie/movie.dart';

class Modules extends Injection with ModularRouterMixin {
  final List<Module> _modules;
  final List<InjectionGroup> _injectionGroups;

  Modules({
    required List<Module> modules,
    required List<InjectionGroup> injectionGroups,
  })  : _modules = modules,
        _injectionGroups = injectionGroups;

  String get initialRoute => MovieModule.routePaths.movies;

  @override
  List<Module> get modules => _modules;

  @override
  List<InjectionGroup> get groups {
    return [
      ..._injectionGroups,
      ..._modules.map((module) => module as InjectionGroup),
    ];
  }

  @override
  bool get enableAuthorize => true;
  @override
  bool get authorized => false;
  @override
  String get unauthorizedRedirectRoute {
    return '';
  }
}
