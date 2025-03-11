import 'package:flutter_sample_architecture/dal/local/contracts/dao/daos/genre_dao.dart';
import 'package:flutter_sample_architecture/dal/local/contracts/entities/genre/genre_entity.dart';
import 'package:flutter_sample_architecture/dal/local/sembast/dao/dao.dart';
import 'package:flutter_sample_architecture/dal/local/sembast/entities/genre/genre_entity.dart';

class GenreDAO extends DAO<GenreEntityContract> implements GenreDAOContract {
  GenreDAO()
      : super(
          collectionName: 'genres',
          constructor: GenreEntity.fromMap,
        );

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
