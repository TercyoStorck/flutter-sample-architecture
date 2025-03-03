import 'package:flutter_sample_architecture/infrastructure/dal/contracts/dao/daos/movie_dao.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/contracts/entities/movie/movie_entity.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/sembast/dao/dao.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/sembast/entities/movie/movie_entity.dart';

class MovieDAO extends DAO<MovieEntityContract> implements MovieDAOContract {
  @override
  String get collection => 'movies';

  @override
  MovieEntityContract constructor(Map<String, dynamic> map) => MovieEntity.fromMap(map);

  @override
  Future<List<MovieEntityContract>> get({required int page}) {
    final finder = Finder(
      filter: Filter.equals("page", page),
    );

    return super.find(finder);
  }

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
  
  @override
  Future<void> removeAllFromPage({required int page}) async {
    final finder = Finder(
      filter: Filter.equals("page", page),
    );

    await super.delete(finder);
  }
}
