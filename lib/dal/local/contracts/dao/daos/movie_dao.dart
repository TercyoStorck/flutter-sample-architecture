import 'package:flutter_sample_architecture/dal/local/contracts/dao/dao_contract.dart';
import 'package:flutter_sample_architecture/dal/local/contracts/entities/movie/movie_entity.dart';

abstract class MovieDAOContract implements DatabaseDAOContract<MovieEntityContract> {
  Future<List<MovieEntityContract>> get({required int page});
  Future<void> removeAllFromPage({required int page});
}
