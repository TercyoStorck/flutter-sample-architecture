import 'package:depin/depin.dart';
import 'package:flutter_sample_architecture/domain/repository/genre_repository.dart';
import 'package:flutter_sample_architecture/domain/repository/movie_repository.dart';
import 'package:flutter_sample_architecture/infrastructure/repository/repositories/genre_repository.dart';
import 'package:flutter_sample_architecture/infrastructure/repository/repositories/movie_repository.dart';

class RepositoryInjectionGroup extends InjectionGroup {
  @override
  List<Injector> get injections {
    return [
      Injector<GenreRepositoryContract>(inject: () => GenreRepository()),
      Injector<MovieRepositoryContract>(inject: () => MovieRepository()),
    ];
  }
}
