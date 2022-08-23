import 'package:auto_route/auto_route.dart';
import 'package:movie_app/pages/bottom_bar_page.dart';
import 'package:movie_app/pages/favorites_page.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/pages/movie_details_page.dart';
import 'package:movie_app/pages/splash_page.dart';
import 'package:movie_app/utils/routes/app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashPage,
      initial: true,
    ),
    CustomRoute(
      page: BottomBarPage,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 500,
    ),
    AutoRoute(
      page: HomePage,
    ),
    AutoRoute(
      page: FavoritesPage,
    ),
    AutoRoute(
      page: MovieDetailsPage,
    ),
  ],
)
class $AppRouter {}
