import 'nodes/genre_dto.dart';

class GenresResponseDTO {
  List<GenreDTO>? genres;
  
  GenresResponseDTO({
    this.genres,
  });

  Map<String, dynamic> toJson() {
    return {
      'genres': genres?.map((x) => x.toMap()).toList(),
    };
  }

  factory GenresResponseDTO.fromJson(Map<String, dynamic> map) {
    return GenresResponseDTO(
      genres: map['genres'] != null ? List<GenreDTO>.from(map['genres']?.map((x) => GenreDTO.fromMap(x))) : null,
    );
  }
}
