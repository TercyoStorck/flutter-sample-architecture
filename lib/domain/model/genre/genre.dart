import 'value_object/value_object.dart';

export 'value_object/value_object.dart';

class Genre {
  GenreId id;
  GenreName name;

  Genre({
    required this.id,
    required this.name,
  });
}
