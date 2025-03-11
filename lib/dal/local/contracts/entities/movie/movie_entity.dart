import 'package:flutter_sample_architecture/domain/model/movie/movie.dart';
import 'package:flutter_sample_architecture/dal/local/contracts/entities/entity.dart';

abstract class MovieEntityContract implements EntityContract {
  final int id;
  final int? voteCount;
  final bool? video;
  final double? voteAverage;
  final String? title;
  final double? popularity;
  final String posterPath;
  final String? originalLanguage;
  final String? originalTitle;
  final List<int>? genreIds;
  final String? backdropPath;
  final bool? adult;
  final String? overview;
  final int? releaseDate;
  final int page;

  MovieEntityContract({
    required this.id,
    this.voteCount,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    required this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
    required this.page,
  });

  @override
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
      'page': page,
    };
  }

  MovieEntityContract.fromMap(Map<String, dynamic> map)
      : id = map['id']?.toInt(),
        voteCount = map['vote_count']?.toInt(),
        video = map['video'],
        voteAverage = map['vote_average']?.toDouble(),
        title = map['title'],
        popularity = map['popularity']?.toDouble(),
        posterPath = map['poster_path']?.isNotEmpty != true
            ? 'https://hro.med.br/wp-content/themes/unbound/images/No-Image-Found-400x264.png'
            : 'https://image.tmdb.org/t/p/w185/${map['poster_path']}',
        originalLanguage = map['original_language'],
        originalTitle = map['original_title'],
        genreIds = List<int>.from(map['genre_ids']),
        backdropPath = map['backdrop_path'],
        adult = map['adult'],
        overview = map['overview'],
        releaseDate = map['release_date']?.toInt(),
        page = map['page'];

  Movie toDomain({List<int>? favoriteIds}) {
    return Movie(
      id: MovieId(this.id),
      title: MovieTitle(this.title ?? ''),
      releaseDate: MovieReleaseDate.fromTimeStamp(this.releaseDate ?? 0),
      overview: MovieOverview(this.overview ?? ''),
      poster: MoviePoster(this.posterPath),
      favorite: MovieFavorite(favoriteIds?.any((favoriteId) => favoriteId == id) == true),
      genres: [],
    );
  }

  MovieEntityContract.fromDomain(Movie movie)
      : id = movie.id.value,
        title = movie.title.value,
        posterPath = movie.poster.value,
        genreIds = movie.genres.map((genre) => genre.id.value).toList(),
        overview = movie.overview.value,
        releaseDate = movie.releaseDate.timeStamp,
        voteCount = null,
        video = null,
        voteAverage = null,
        popularity = null,
        originalLanguage = null,
        originalTitle = null,
        backdropPath = null,
        adult = null,
        page = 0;
}
