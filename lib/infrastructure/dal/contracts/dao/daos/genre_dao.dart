import 'package:flutter_sample_architecture/infrastructure/dal/contracts/dao/dao_contract.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/contracts/entities/genre/genre_entity.dart';

abstract class GenreDAOContract implements DAOContract<GenreEntityContract> {
  Future<GenreEntityContract> get(int id);
}
