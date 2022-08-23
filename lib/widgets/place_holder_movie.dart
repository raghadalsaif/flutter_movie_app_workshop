import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/utils/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class PlaceHolderMovie extends StatelessWidget {
  const PlaceHolderMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.lightBlue,
      ),
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset('assets/images/logo.svg'),
    );
  }
}
