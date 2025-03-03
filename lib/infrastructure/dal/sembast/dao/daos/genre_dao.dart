import 'package:flutter_sample_architecture/infrastructure/dal/contracts/dao/daos/genre_dao.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/contracts/entities/genre/genre_entity.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/sembast/dao/dao.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/sembast/entities/genre/genre_entity.dart';

class GenreDAO extends DAO<GenreEntityContract> implements GenreDAOContract {
  @override
  String get collection => 'genres';

  @override
  GenreEntityContract constructor(Map<String, dynamic> map) => GenreEntity.fromMap(map);

  @override
  Future<GenreEntityContract> get(int id) async {
    final finder = Finder(
      filter: Filter.equals("id", id),
    );

    return (await super.find(finder)).first;
  }

  @override
  Future<void> update(GenreEntityContract entity) async {
    final finder = Finder(
      filter: Filter.equals("id", entity.id),
    );

    await super.modify(entity, finder);
  }

  @override
  Future<void> remove(GenreEntityContract entity) async {
    final finder = Finder(
      filter: Filter.equals("id", entity.id),
    );

    await super.delete(finder);
  }
}
