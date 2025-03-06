import 'package:flutter_sample_architecture/dal/local/contracts/dao/dao_contract.dart';
import 'package:flutter_sample_architecture/dal/local/contracts/entities/genre/genre_entity.dart';

abstract class GenreDAOContract implements DatabaseDAOContract<GenreEntityContract> {
  Future<GenreEntityContract> get(int id);
}
