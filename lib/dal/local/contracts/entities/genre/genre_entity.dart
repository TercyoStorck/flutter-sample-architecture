import 'package:flutter_sample_architecture/domain/model/genre/genre.dart';
import 'package:flutter_sample_architecture/dal/local/contracts/entities/entity.dart';

abstract class GenreEntityContract implements EntityContract {
  final int id;
  final String name;

  GenreEntityContract({
    required this.id,
    required this.name,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  GenreEntityContract.fromMap(Map<String, dynamic> map)
      : id = map['id']?.toInt(),
        name = map['name'];

  Genre toDomain() {
    return Genre(
      id: GenreId(this.id),
      name: GenreName(this.name),
    );
  }
}
