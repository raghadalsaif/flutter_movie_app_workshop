import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/utils/constants/app_constants.dart';
import 'package:movie_app/utils/theme/app_colors.dart';
import 'package:movie_app/widgets/place_holder_movie.dart';

class AppImageNetwork extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final Widget? loadingWidget;
  final BoxFit? fit;
  const AppImageNetwork({
    Key? key,
    required this.imageUrl,
    this.width,
    this.loadingWidget,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: AppConstants.baseImageUrl + (imageUrl ?? ''),
      fit: fit ?? BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          loadingWidget ??
          Center(
            child: CircularProgressIndicator.adaptive(
              value: downloadProgress.progress,
              backgroundColor: AppColors.lightGray,
            ),
          ),
      width: width,
      height: 300,
      errorWidget: (context, url, error) => const PlaceHolderMovie(),
    );
  }
}
