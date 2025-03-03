import 'package:dart_command/command.dart';
import 'package:depin/depin.dart';
import 'package:flutter_sample_architecture/domain/model/genre/genre.dart';
import 'package:flutter_sample_architecture/domain/repository/genre_repository.dart';

class FetchGenresCommand extends Command<List<Genre>?> {
  final _genreRepository = Inject.instance<GenreRepositoryContract>();

  @override
  Future<List<Genre>> action(_) async {
    final genres = await _genreRepository.genres();
    return genres;
  }

  @override
  void validate(_) {}
}
