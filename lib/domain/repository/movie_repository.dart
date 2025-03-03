import 'package:flutter_sample_architecture/domain/model/genre/genre.dart';
import 'package:flutter_sample_architecture/domain/model/movie/movie.dart';

abstract class MovieRepositoryContract {
  Future<List<Movie>> movies({
    required List<Genre> genres,
    int page = 1,
  });
  Future<List<Movie>> favorites({
    required List<Genre> genres,
  });
  Future<void> addToFavorites(Movie movie);
  Future<void> removeFromFavorites(Movie movie);
}
