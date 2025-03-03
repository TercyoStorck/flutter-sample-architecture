import 'package:flutter_sample_architecture/infrastructure/dal/contracts/dao/dao_contract.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/contracts/entities/movie/movie_entity.dart';

abstract class MovieDAOContract implements DAOContract<MovieEntityContract> {
  Future<List<MovieEntityContract>> get({required int page});
  Future<void> removeAllFromPage({required int page});
}
