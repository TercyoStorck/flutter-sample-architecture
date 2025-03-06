import 'package:depin/depin.dart';
import 'package:flutter_sample_architecture/dal/local/contracts/dao/daos/favorite_movie_dao.dart';
import 'package:flutter_sample_architecture/dal/local/contracts/dao/daos/genre_dao.dart';
import 'package:flutter_sample_architecture/dal/local/contracts/dao/daos/movie_dao.dart';
import 'package:flutter_sample_architecture/dal/local/contracts/dao/daos/movies_request_informations_dao.dart';
import 'package:flutter_sample_architecture/dal/local/hive/dao/daos/movies_request_informations_dao.dart';
import 'package:flutter_sample_architecture/dal/local/sembast/dao/daos/favorite_movie_dao.dart';
import 'package:flutter_sample_architecture/dal/local/sembast/dao/daos/genre_dao.dart';
import 'package:flutter_sample_architecture/dal/local/sembast/dao/daos/movie_dao.dart';

class DalInjectionGroup extends InjectionGroup {
  @override
  List<Injector> get injections {
    return [
      Injector<GenreDAOContract>(inject: () => GenreDAO()),
      Injector<MovieDAOContract>(inject: () => MovieDAO()),
      Injector<FavoriteMovieDAOContract>(inject: () => FavoriteMovieDAO()),
      Injector<MoviesRequestInformationsDAOContract>(inject: () => MoviesRequestInformationsDAO()),
    ];
  }
}
