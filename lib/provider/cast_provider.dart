import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/cast_model.dart';
import 'package:movie_app/utils/constants/app_constants.dart';

final castProvider =
    FutureProvider.family<List<CastModel>, int>((ref, id) async {
  final response = await Dio().get(
    '${AppConstants.baseUrl}${AppConstants.cast(id)}',
    queryParameters: {
      "api_key": AppConstants.apiKey,
    },
  );

  List<CastModel> cast = [];

  for (var item in response.data['cast']) {
    cast.add(CastModel.fromJson(item));
  }
  return cast.where((element) => element.profilePath != null).toList();
});
