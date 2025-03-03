import 'package:dart_command/command.dart';
import 'package:depin/depin.dart';
import 'package:flutter_sample_architecture/domain/model/exceptions.dart';
import 'package:flutter_sample_architecture/domain/model/genre/genre.dart';
import 'package:flutter_sample_architecture/domain/model/movie/movie.dart';
import 'package:flutter_sample_architecture/domain/repository/movie_repository.dart';

class FetchMoviesCommand extends Command<List<Movie>?> {
  final _movieRepository = Inject.instance<MovieRepositoryContract>();

  int _page = 0;
  List<Genre> _genres = [];

  set genres(List<Genre> genres) => _genres = genres;

  @override
  Future<List<Movie>> action(List<Movie>? currentValue) async {
    _page++;

    final movies = await _movieRepository.movies(genres: _genres, page: _page);

    if (currentValue == null) {
      return movies;
    }

    currentValue.addAll(movies);
    
    return currentValue;
  }

  @override
  void validate(List<Movie>? currentValue) {
    if (_genres.isEmpty) {
      throw EmptyValidationException();
    }
  }
}
