import 'package:flutter_sample_architecture/infrastructure/dal/contracts/entities/movie/movie_entity.dart';
import 'package:flutter_sample_architecture/infrastructure/service/themoviedb/dto/dtos/movies/response/nodes/movie_dto.dart';

class MovieEntity extends MovieEntityContract {
  MovieEntity({
    required super.id,
    super.voteCount,
    super.video,
    super.voteAverage,
    super.title,
    super.popularity,
    required super.posterPath,
    super.originalLanguage,
    super.originalTitle,
    super.genreIds,
    super.backdropPath,
    super.adult,
    super.overview,
    super.releaseDate,
    required super.page,
  });

  MovieEntity.fromMap(super.map) : super.fromMap();
  MovieEntity.fromDomain(super.movie) : super.fromDomain();

  factory MovieEntity.fromDto(MovieDTO dto, int page) {
    return MovieEntity(
      id: dto.id ?? 0,
      voteCount: dto.voteCount,
      video: dto.video,
      voteAverage: dto.voteAverage,
      title: dto.title,
      popularity: dto.popularity,
      posterPath: dto.posterPath ?? '',
      originalLanguage: dto.originalLanguage,
      originalTitle: dto.originalTitle,
      genreIds: dto.genreIds,
      backdropPath: dto.backdropPath,
      adult: dto.adult,
      overview: dto.overview,
      releaseDate: DateTime.parse(dto.releaseDate ?? '').millisecondsSinceEpoch,
      page: page,
    );
  }
}
