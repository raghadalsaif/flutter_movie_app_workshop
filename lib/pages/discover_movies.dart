import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/provider/movie_by_genre_provider.dart';
import 'package:movie_app/utils/constants/app_constants.dart';
import 'package:movie_app/widgets/loading_list_movies.dart';
import 'package:movie_app/widgets/movies_list.dart';

class DiscoverMovies extends ConsumerWidget {
  const DiscoverMovies({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final discoverMoviesState = ref.watch(movieByGenreProvider);
    return discoverMoviesState.when(
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
