import 'package:flutter_sample_architecture/dal/local/contracts/entities/genre/genre_entity.dart';

class GenreEntity extends GenreEntityContract {
  GenreEntity({
    required super.id,
    required super.name,
  });
  
  GenreEntity.fromMap(super.map) : super.fromMap();
}
