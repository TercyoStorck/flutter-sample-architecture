import 'package:flutter_sample_architecture/infrastructure/dal/contracts/dao/dao_contract.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/contracts/entities/movies_request_informations/movies_request_informations_entity.dart';

abstract class MoviesRequestInformationsDAOContract implements DAOContract<MoviesRequestInformationsEntityContract> {
  Future<MoviesRequestInformationsEntityContract?> entity();
}
