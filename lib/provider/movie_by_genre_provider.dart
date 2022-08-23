import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/provider/selected_genre.dart';
import 'package:movie_app/utils/constants/app_constants.dart';

final movieByGenreProvider = FutureProvider((ref) async {
  final genre = ref.watch(selectedGenreProvider);
  final response = await Dio().get(
    '${AppConstants.baseUrl}${AppConstants.discoverMovie}',
    queryParameters: {
      "api_key": AppConstants.apiKey,
      "with_genres": genre?.id,
    },
  );

  List<MovieModel> movies = [];

  for (var item in response.data['results']) {
    movies.add(MovieModel.fromJson(item));
  }
  return movies;
});
