import 'package:flutter_sample_architecture/infrastructure/dal/contracts/entities/movies_request_informations/movies_request_informations_entity.dart';
import 'package:flutter_sample_architecture/infrastructure/service/themoviedb/dto/dtos/movies/response/movies_request_dto.dart';

class MoviesRequestInformationsEntity extends MoviesRequestInformationsEntityContract {
  MoviesRequestInformationsEntity({
    required super.minimumDate,
    required super.maximumDate,
    required super.totalPages,
  });

  MoviesRequestInformationsEntity.fromMap(super.map) : super.fromMap();

  factory MoviesRequestInformationsEntity.fromDto(MoviesRequestDTO dto) {
    return MoviesRequestInformationsEntity(
      maximumDate: DateTime.parse(dto.dates?.maximum ?? '').millisecondsSinceEpoch,
      minimumDate: DateTime.parse(dto.dates?.minimum ?? '').millisecondsSinceEpoch,
      totalPages: dto.totalPages ?? 0,
    );
  }
}
