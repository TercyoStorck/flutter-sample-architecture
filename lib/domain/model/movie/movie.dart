import 'package:flutter_sample_architecture/domain/model/exceptions.dart';
import 'package:flutter_sample_architecture/domain/model/genre/genre.dart';

import 'value_object/value_object.dart';

export 'value_object/value_object.dart';

class Movie {
  MovieId id;
  MovieTitle title;
  MovieReleaseDate releaseDate;
  MovieOverview overview;
  MoviePoster poster;
  MovieFavorite favorite;
  List<Genre> _genres;

  Movie({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.poster,
    required this.favorite,
    required List<Genre> genres,
  }) : _genres = genres;

  List<Genre> get genres => _genres;

  set genres(List<Genre> genres) {
    if (genres.isEmpty) {
      throw EmptyValidationException();
    }

    _genres = genres;
  }
}
