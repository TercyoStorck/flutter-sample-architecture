import 'package:flutter_sample_architecture/domain/model/genre/genre.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/contracts/entities/genre/genre_entity.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/sembast/entities/genre/genre_entity.dart';

class GenreDTO {
  final int? id;
  final String? name;

  GenreDTO({
    this.id,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory GenreDTO.fromMap(Map<String, dynamic> map) {
    return GenreDTO(
      id: map['id']?.toInt(),
      name: map['name'],
    );
  }

  GenreEntityContract toEntity() {
    return GenreEntity(
      id: this.id ?? 0,
      name: this.name ?? '',
    );
  }

  Genre toDomain() {
    return Genre(
      id: GenreId(this.id ?? 0),
      name: GenreName(this.name ?? ''),
    );
  }
}
