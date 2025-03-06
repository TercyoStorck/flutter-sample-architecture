import 'package:flutter_sample_architecture/dal/local/contracts/dao/daos/movies_request_informations_dao.dart';
import 'package:flutter_sample_architecture/dal/local/contracts/entities/movies_request_informations/movies_request_informations_entity.dart';
import 'package:flutter_sample_architecture/dal/local/hive/dao/dao.dart';
import 'package:flutter_sample_architecture/dal/local/hive/entities/movies_request_informations/movies_request_informations_entity.dart';

class MoviesRequestInformationsDAO extends DAO<MoviesRequestInformationsEntityContract> implements MoviesRequestInformationsDAOContract {
  @override
  String get collection => 'moviesRequestInformations';

  @override
  MoviesRequestInformationsEntityContract constructor(Map<String, dynamic> map) => MoviesRequestInformationsEntity.fromMap(map);
}
