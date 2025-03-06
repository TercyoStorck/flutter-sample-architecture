import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'dto/dto.dart';

part 'service.g.dart';

const _apiKey = '1f54bd990f1cdfb230adb312546d765d';
const _language = 'en-US';

@RestApi()
abstract class TheMovieDBService {
  factory TheMovieDBService(Dio dio, {String baseUrl}) = _TheMovieDBService;

  @GET("/3/genre/movie/list")
  Future<GenresResponseDTO> genres({
    @Query('api_key') String apiKey = _apiKey,
    @Query('language') String language = _language,
  });

  @GET("/3/movie/upcoming")
  Future<MoviesRequestDTO> upcomingMovies({
    @Query('page') required int page,
    @Query('api_key') String apiKey = _apiKey,
    @Query('language') String language = _language,
  });
}
