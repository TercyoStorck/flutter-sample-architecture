import 'package:flutter_sample_architecture/dal/local/contracts/dao/daos/favorite_movie_dao.dart';
import 'package:flutter_sample_architecture/dal/local/contracts/entities/movie/movie_entity.dart';
import 'package:flutter_sample_architecture/dal/local/sembast/dao/dao.dart';
import 'package:flutter_sample_architecture/dal/local/sembast/entities/movie/movie_entity.dart';

class FavoriteMovieDAO extends DAO<MovieEntityContract> implements FavoriteMovieDAOContract {
  @override
  String get collection => 'favoriteMovies';

  @override
  MovieEntityContract constructor(Map<String, dynamic> map) => MovieEntity.fromMap(map);

  @override
  Future<void> update(MovieEntityContract entity) async {
    final finder = Finder(
      filter: Filter.equals("id", entity.id),
    );

    await super.modify(entity, finder);
  }

  @override
  Future<void> remove(MovieEntityContract entity) async {
    final finder = Finder(
      filter: Filter.equals("id", entity.id),
    );

    await super.delete(finder);
  }
}
