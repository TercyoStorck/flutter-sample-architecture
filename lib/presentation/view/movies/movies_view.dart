import 'package:dart_command/command.dart';
import 'package:flutter_sample_architecture/application/controller/controllers/movies/movies_controller.dart';
import 'package:flutter_sample_architecture/application/service/date_time_service.dart';
import 'package:flutter_sample_architecture/domain/model/movie/movie.dart';
import 'package:flutter_sample_architecture/presentation/widgets/custom_stateful_widget/custom_state.dart';
import 'package:flutter_sample_architecture/presentation/widgets/custom_stateful_widget/custom_stateful_widget.dart';

const _intlContext = ['movies'];

class MoviesView extends CustomStatefulWidget {
  const MoviesView({super.key});

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends CustomState<MoviesView, MoviesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextIntl(
          'appBarTitle',
          parent: _intlContext,
        ),
      ),
      body: CustomScrollView(
        controller: super.controller.scrollController,
        slivers: [
          StreamBuilder<List<Movie>?>(
            stream: super.controller.moviesStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text(snapshot.error.toString()),
                  ),
                );
              }

              if (!snapshot.hasData) {
                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator.adaptive(),
                  ),
                );
              }

              return SliverList.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final movie = snapshot.data![index];

                  return ListTile(
                    title: Text(movie.title.value),
                    subtitle: Text(ddMMyyyy(movie.releaseDate.value)),
                  );
                },
              );
            },
          ),
          StreamBuilder(
            stream: super.controller.fetchMoviesState,
            builder: (context, snapshot) {
              if (snapshot.data != CommandState.running) {
                return const SliverToBoxAdapter();
              }

              return const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 36.0),
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
