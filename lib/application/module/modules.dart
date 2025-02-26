import 'package:depin/depin.dart';
import 'package:modular_router/modular_router.dart';

class Modules extends Injection with ModularRouterMixin {
  String get initialRoute => '';

  @override
  List<Module> get modules {
    return [];
  }

  @override
  List<InjectionGroup> get groups {
    return [];
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
