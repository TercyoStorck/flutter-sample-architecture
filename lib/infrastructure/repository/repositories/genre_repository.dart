import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:depin/depin.dart';
import 'package:flutter_sample_architecture/domain/model/exceptions.dart';
import 'package:flutter_sample_architecture/domain/model/genre/genre.dart';
import 'package:flutter_sample_architecture/domain/repository/genre_repository.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/contracts/dao/daos/genre_dao.dart';
import 'package:flutter_sample_architecture/infrastructure/service/themoviedb/dto/dtos/genres/response/nodes/genre_dto.dart';
import 'package:flutter_sample_architecture/infrastructure/service/themoviedb/service.dart';

class GenreRepository implements GenreRepositoryContract {
  final _movieService = Inject.instance<TheMovieDBService>();
  final _genreDao = Inject.instance<GenreDAOContract>();

  @override
  Future<List<Genre>> genres() async {
    final completerResponseDto = Completer<List<GenreDTO>>();
    final connectivityResult = await Connectivity().checkConnectivity();

    if (!connectivityResult.any((result) => result == ConnectivityResult.none)) {
      _movieService.genres().then((responseDto) async {
        completerResponseDto.complete(responseDto.genres ?? []);

        final entities = responseDto.genres?.map((dto) => dto.toEntity()).toList() ?? [];
        await _genreDao.clear();
        await _genreDao.addAll(entities);
      });

      await Future.delayed(const Duration(seconds: 3));
    }

    if (!completerResponseDto.isCompleted) {
      final entities = await _genreDao.all();
      final genres = entities.map((entity) => entity.toDomain()).toList();

      if (genres.isEmpty) {
        throw NoDataFoundException();
      }

      genres.sort((p1, p2) => p1.name.value.compareTo(p2.name.value));
      return genres;
    }

    final responseDto = await completerResponseDto.future;
    final genres = responseDto.map((dto) => dto.toDomain()).toList();
    genres.sort((p1, p2) => p1.name.value.compareTo(p2.name.value));

    return genres;
  }
}
