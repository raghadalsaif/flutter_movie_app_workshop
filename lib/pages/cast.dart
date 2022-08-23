import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/provider/cast_provider.dart';
import 'package:movie_app/provider/cast_provider.dart';
import 'package:movie_app/provider/movie_by_genre_provider.dart';
import 'package:movie_app/utils/constants/app_constants.dart';
import 'package:movie_app/widgets/cast_list.dart';
import 'package:movie_app/widgets/loading_list_movies.dart';
import 'package:movie_app/widgets/movies_list.dart';

class Cast extends ConsumerWidget {
  final int movieID;
  const Cast({
    Key? key,
    required this.movieID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final castState = ref.watch(castProvider(movieID));
    return castState.when(
      data: (cast) {
        return CastList(
          cast: cast,
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const LoadingListMovies(),
    );
  }
}
