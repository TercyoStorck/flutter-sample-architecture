import 'package:dart_command/command.dart';
import 'package:depin/depin.dart';
import 'package:flutter_sample_architecture/application/controller/contracts/disposable_controller.dart';
import 'package:flutter_sample_architecture/application/controller/custom/custom_scroll_controller.dart';
import 'package:flutter_sample_architecture/domain/model/movie/movie.dart';

import 'commands/fetch_genres.dart';
import 'commands/fetch_movies.dart';

class MoviesController implements DisposableController {
  final _fetchGenresCommand = Inject.instance<FetchGenresCommand>();
  final _fetchMoviesCommand = Inject.instance<FetchMoviesCommand>();

  final _scrollController = CustomScrollController();

  MoviesController() {
    _fetchGenresCommand.execute(
      onCompleted: (genres) {
        _fetchMoviesCommand.genres = genres ?? [];
        _fetchMoviesCommand.execute();
      },
    );

    _scrollController.endOfListNotifier(
      () => _fetchMoviesCommand.execute(),
      offset: 120.0,
    );
  }

  CustomScrollController get scrollController => _scrollController;

  Stream<List<Movie>?> get moviesStream => _fetchMoviesCommand;
  Stream<CommandState> get fetchMoviesState {
    return _fetchMoviesCommand.map((_) {
      return _fetchMoviesCommand.value != null ? _fetchMoviesCommand.state : CommandState.created;
    });
  }

  @override
  void dispose() {
    _fetchGenresCommand.dispose();
    _fetchMoviesCommand.dispose();
  }
}
