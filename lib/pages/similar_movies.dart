import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/provider/similar_movies_provider.dart';
import 'package:movie_app/utils/constants/app_constants.dart';
import 'package:movie_app/widgets/loading_list_movies.dart';
import 'package:movie_app/widgets/movies_list.dart';

class SimilarMovies extends ConsumerWidget {
  final int movieId;
  const SimilarMovies({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final similarMoviesState = ref.watch(similarMoviesProvider(movieId));
    return similarMoviesState.when(
      data: (movies) {
        return MoviesList(
          movies: movies,
          heroKey: AppConstants.discoverKey,
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const LoadingListMovies(),
    );
  }
}
