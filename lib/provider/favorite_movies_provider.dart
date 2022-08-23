import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/movie_model.dart';

final favoriteProvider =
    ChangeNotifierProvider((ref) => FavoriteMoviesProvider());

class FavoriteMoviesProvider extends ChangeNotifier {
  final List<MovieModel> favoritesMovies = [];

  void addMovieToFavorite(MovieModel movie) {
    if (favoritesMovies.map((e) => e.id).contains(movie.id)) {
      _removeMovieToFavorite(movie.id);
      return;
    }
    favoritesMovies.add(movie);
    notifyListeners();
  }

  void _removeMovieToFavorite(int movieID) {
    favoritesMovies
        .remove(favoritesMovies.firstWhere((element) => element.id == movieID));
    notifyListeners();
  }

  bool isFavorite(int movieID) {
    return favoritesMovies.map((e) => e.id).contains(movieID);
  }
}
