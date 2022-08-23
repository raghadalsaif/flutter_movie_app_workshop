import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/utils/constants/app_constants.dart';
import 'package:movie_app/utils/routes/app_router.gr.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      context.router.replace(const BottomBarRoute());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swing(
          child: Center(
        child: Hero(
            tag: AppConstants.splashKey,
            child: SvgPicture.asset('assets/images/logo.svg')),
      )),
    );
  }
}
