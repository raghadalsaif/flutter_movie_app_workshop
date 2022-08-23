import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/provider/favorite_movies_provider.dart';
import 'package:movie_app/utils/constants/app_constants.dart';

import 'package:movie_app/widgets/movies_list.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMovies = ref.watch(favoriteProvider).favoritesMovies;
    return Scaffold(
        appBar: AppBar(),
        body: MoviesList(
          movies: favoriteMovies,
          heroKey: AppConstants.favoriteKey,
        ));
  }
}
