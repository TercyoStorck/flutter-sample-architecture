import 'package:depin/depin.dart';
import 'package:flutter_sample_architecture/application/controller/controllers/movies/commands/fetch_genres.dart';
import 'package:flutter_sample_architecture/application/controller/controllers/movies/commands/fetch_movies.dart';
import 'package:flutter_sample_architecture/application/controller/controllers/movies/movies_controller.dart';
import 'package:flutter_sample_architecture/presentation/view/movies/movies_view.dart';
import 'package:modular_router/modular_router.dart';

const String _moduleName = "movies";

class MovieModule extends Module implements InjectionGroup {
  static final routePaths = _Routes();

  @override
  String get name => _moduleName;

  @override
  bool get allowAnonymous => true;

  @override
  List<ModuleRoute> get routes {
    return [
      ModuleRoute(
        path: routePaths._movies,
        builder: (_) => const MoviesView(),
      ),
    ];
  }

  @override
  List<Injector> get injections {
    return [
      //Controllers
      Injector<MoviesController>(inject: () => MoviesController()),
      //Commands
      Injector<FetchGenresCommand>(inject: () => FetchGenresCommand()),
      Injector<FetchMoviesCommand>(inject: () => FetchMoviesCommand()),
    ];
  }
}

class _Routes {
  final String _movies = '/';

  String get movies => "$_moduleName$_movies";
}
