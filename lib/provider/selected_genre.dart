import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/genre_model.dart';

final selectedGenreProvider = StateProvider<GenreModel?>((ref) => null);
