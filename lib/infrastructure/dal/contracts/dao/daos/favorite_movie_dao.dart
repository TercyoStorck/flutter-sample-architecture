import 'package:flutter_sample_architecture/infrastructure/dal/contracts/dao/dao_contract.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/contracts/entities/movie/movie_entity.dart';

abstract class FavoriteMovieDAOContract implements DAOContract<MovieEntityContract> {}
