import 'package:movie_app/utils/constants/app_constants.dart';

class HelperFunctions {
  String? movieImagePath(String? posterImage, String? backDropImage) {
    if (posterImage != null) {
      return AppConstants.baseImageUrl + posterImage;
    } else if (backDropImage != null) {
      return AppConstants.baseImageUrl + backDropImage;
    }
    return null;
  }
}
