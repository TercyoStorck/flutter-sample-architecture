import 'package:flutter_sample_architecture/domain/model/movie/movie.dart';

class MovieDTO {
  final int? id;
  final int? voteCount;
  final bool? video;
  final double? voteAverage;
  final String? title;
  final double? popularity;
  final String? posterPath;
  final String? originalLanguage;
  final String? originalTitle;
  final List<int>? genreIds;
  final String? backdropPath;
  final bool? adult;
  final String? overview;
  final String? releaseDate;

  MovieDTO({
    this.id,
    this.voteCount,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'vote_count': voteCount,
      'video': video,
      'vote_average': voteAverage,
      'title': title,
      'popularity': popularity,
      'poster_path': posterPath,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'genre_ids': genreIds,
      'backdrop_path': backdropPath,
      'adult': adult,
      'overview': overview,
      'release_date': releaseDate,
    };
  }

  factory MovieDTO.fromMap(Map<String, dynamic> map) {
    return MovieDTO(
      id: map['id']?.toInt(),
      voteCount: map['vote_count']?.toInt(),
      video: map['video'],
      voteAverage: map['vote_average']?.toDouble(),
      title: map['title'],
      popularity: map['popularity']?.toDouble(),
      posterPath: map['poster_path'],
      originalLanguage: map['original_language'],
      originalTitle: map['original_title'],
      genreIds: List<int>.from(map['genre_ids']),
      backdropPath: map['backdrop_path'],
      adult: map['adult'],
      overview: map['overview'],
      releaseDate: map['release_date'],
    );
  }

  Movie toDomain({List<int>? favoriteIds}) {
    return Movie(
      id: MovieId(this.id ?? 0),
      title: MovieTitle(this.title ?? ''),
      releaseDate: MovieReleaseDate.fromISO8601(this.releaseDate ?? ''),
      overview: MovieOverview(this.overview ?? ''),
      poster: MoviePoster(this.posterPath ?? ''),
      favorite: MovieFavorite(favoriteIds?.any((favoriteId) => favoriteId == id) == true),
      genres: [],
    );
  }
}
