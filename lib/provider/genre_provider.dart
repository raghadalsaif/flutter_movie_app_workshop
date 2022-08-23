import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/genre_model.dart';
import 'package:movie_app/utils/constants/app_constants.dart';

final genreProvider = FutureProvider((ref) async {
  final response = await Dio().get(
    '${AppConstants.baseUrl}${AppConstants.genre}',
    queryParameters: {"api_key": AppConstants.apiKey},
  );

  List<GenreModel> genres = [];
  genres.add(GenreModel(
    id: null,
    name: 'All',
  ));

  for (var item in response.data['genres']) {
    genres.add(GenreModel.fromJson(item));
  }
  return genres;
});
