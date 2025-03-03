import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:depin/depin.dart';
import 'package:flutter_sample_architecture/domain/model/exceptions.dart';
import 'package:flutter_sample_architecture/domain/model/genre/genre.dart';
import 'package:flutter_sample_architecture/domain/model/movie/movie.dart';
import 'package:flutter_sample_architecture/domain/repository/movie_repository.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/contracts/dao/daos/favorite_movie_dao.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/contracts/dao/daos/movie_dao.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/contracts/dao/daos/movies_request_informations_dao.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/contracts/entities/movies_request_informations/movies_request_informations_entity.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/hive/entities/movies_request_informations/movies_request_informations_entity.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/sembast/entities/movie/movie_entity.dart';
import 'package:flutter_sample_architecture/infrastructure/service/themoviedb/dto/dtos/movies/response/nodes/movie_dto.dart';
import 'package:flutter_sample_architecture/infrastructure/service/themoviedb/service.dart';

class MovieRepository implements MovieRepositoryContract {
  final _movieService = Inject.instance<TheMovieDBService>();
  final _movieDao = Inject.instance<MovieDAOContract>();
  final _favoriteMovieDao = Inject.instance<FavoriteMovieDAOContract>();
  final _moviesRequestInformationsDao = Inject.instance<MoviesRequestInformationsDAOContract>();

  @override
  Future<List<Movie>> movies({
    required List<Genre> genres,
    int page = 1,
  }) async {
    MoviesRequestInformationsEntityContract? requestInformationEntity = await _moviesRequestInformationsDao.entity();

    if (requestInformationEntity?.totalPages != null && page > requestInformationEntity!.totalPages) {
      throw MaxDataFoundException();
    }

    final completerResponseDto = Completer<List<MovieDTO>>();
    final connectivityResult = await Connectivity().checkConnectivity();

    if (!connectivityResult.any((result) => result == ConnectivityResult.none)) {
      //This block of code is responsible for get data and keep your database updated
      _movieService.upcomingMovies(page: page).then((responseDto) async {
        requestInformationEntity = MoviesRequestInformationsEntity.fromDto(responseDto);
        await _moviesRequestInformationsDao.set(requestInformationEntity!);

        completerResponseDto.complete(responseDto.results ?? []);

        final entities = responseDto.results?.map((dto) => MovieEntity.fromDto(dto, page)).toList() ?? [];
        await _movieDao.removeAllFromPage(page: page);
        await _movieDao.addAll(entities);
      });

      //Waits 3 seconds to response. If no response on 3 seconds, it'll try to get data from database
      await Future.delayed(const Duration(seconds: 3));
    }

    final favorites = await this.favorites(genres: genres);
    final favoriteIds = favorites.map((favorite) => favorite.id.value).toList();

    //Try to get data from database and return it
    if (!completerResponseDto.isCompleted) {
      final entities = await _movieDao.get(page: page);
      final movies = entities.map((entity) => entity.toDomain(favoriteIds: favoriteIds)).toList();

      if (movies.isEmpty) {
        throw NoDataFoundException();
      }

      return movies;
    }

    //Return data from response
    final responseDto = await completerResponseDto.future;
    final movies = responseDto.map((dto) => dto.toDomain(favoriteIds: favoriteIds)).toList();

    return movies;
  }

  @override
  Future<void> addToFavorites(Movie movie) async {
    final entity = MovieEntity.fromDomain(movie);
    await _favoriteMovieDao.add(entity);
  }

  @override
  Future<List<Movie>> favorites({
    required List<Genre> genres,
  }) async {
    final favoriteEntities = await _favoriteMovieDao.all();
    final favorites = favoriteEntities.map((entity) {
      final favorite = entity.toDomain();

      favorite.genres = genres.where((genre) {
        return entity.genreIds?.any((id) => genre.id.value == id) == true;
      }).toList();

      return favorite;
    }).toList();

    return favorites;
  }

  @override
  Future<void> removeFromFavorites(Movie movie) async {
    final entity = MovieEntity.fromDomain(movie);
    await _favoriteMovieDao.remove(entity);
  }
}
