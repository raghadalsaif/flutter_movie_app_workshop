import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/provider/favorite_movies_provider.dart';
import 'package:movie_app/utils/constants/app_constants.dart';

final nowPlayingMovieProvider = FutureProvider((ref) async {
  final response = await Dio().get(
    '${AppConstants.baseUrl}${AppConstants.nowPlaying}',
    queryParameters: {"api_key": AppConstants.apiKey},
  );

  List<MovieModel> movies = [];

  for (var item in response.data['results']) {
    movies.add(MovieModel.fromJson(item));
  }
  return movies;
});
