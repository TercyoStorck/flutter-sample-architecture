import 'package:flutter_sample_architecture/dal/local/contracts/dao/dao_contract.dart';
import 'package:flutter_sample_architecture/dal/local/contracts/entities/movie/movie_entity.dart';

abstract class FavoriteMovieDAOContract implements DatabaseDAOContract<MovieEntityContract> {}
