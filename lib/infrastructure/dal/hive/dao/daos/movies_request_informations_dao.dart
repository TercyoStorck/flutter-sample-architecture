import 'package:flutter_sample_architecture/infrastructure/dal/contracts/dao/daos/movies_request_informations_dao.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/contracts/entities/movies_request_informations/movies_request_informations_entity.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/hive/dao/dao.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/hive/entities/movies_request_informations/movies_request_informations_entity.dart';

class MoviesRequestInformationsDAO extends DAO<MoviesRequestInformationsEntityContract> implements MoviesRequestInformationsDAOContract {
  @override
  String get collection => 'moviesRequestInformations';

  @override
  MoviesRequestInformationsEntityContract constructor(Map<String, dynamic> map) => MoviesRequestInformationsEntity.fromMap(map);
}
