import 'package:flutter/material.dart';
import 'package:movie_app/utils/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class LoadingMovie extends StatelessWidget {
  const LoadingMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.lightBlue.withOpacity(0.5),
      highlightColor: AppColors.lightBlue,
      child: Container(
        height: 250,
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.lightBlue,
        ),
      ),
    );
  }
}
