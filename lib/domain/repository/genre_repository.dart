import 'package:flutter_sample_architecture/domain/model/genre/genre.dart';

abstract class GenreRepositoryContract {
  Future<List<Genre>> genres();
}