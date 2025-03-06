import 'nodes/movie_dates_dto.dart';
import 'nodes/movie_dto.dart';

class MoviesRequestDTO {
  final MovieDatesDTO? dates;
  final int? page;
  final List<MovieDTO>? results;
  final int? totalPages;
  final int? totalResults;

  MoviesRequestDTO({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  Map<String, dynamic> toJson() {
    return {
      'dates': dates?.toMap(),
      'page': page,
      'results': results?.map((x) => x.toMap()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  factory MoviesRequestDTO.fromJson(Map<String, dynamic> map) {
    return MoviesRequestDTO(
      dates: map['dates'] != null ? MovieDatesDTO.fromMap(map['dates']) : null,
      page: map['page']?.toInt(),
      results: map['results'] != null ? List<MovieDTO>.from(map['results']?.map((x) => MovieDTO.fromMap(x))) : null,
      totalPages: map['total_pages']?.toInt(),
      totalResults: map['total_results']?.toInt(),
    );
  }
}
