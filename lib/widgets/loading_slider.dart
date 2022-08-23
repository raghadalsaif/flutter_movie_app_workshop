import 'package:flutter/material.dart';
import 'package:movie_app/utils/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class LoadingSlider extends StatelessWidget {
  const LoadingSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.lightBlue.withOpacity(0.5),
      highlightColor: AppColors.lightBlue,
      child: Container(
        width: double.infinity,
        height: 300,
        color: AppColors.lightBlue,
      ),
    );
  }
}
