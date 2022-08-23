// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../models/movie_model.dart' as _i8;
import '../../pages/bottom_bar_page.dart' as _i2;
import '../../pages/favorites_page.dart' as _i4;
import '../../pages/home_page.dart' as _i3;
import '../../pages/movie_details_page.dart' as _i5;
import '../../pages/splash_page.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    BottomBarRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.BottomBarPage(),
          transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 500,
          opaque: true,
          barrierDismissible: false);
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomePage());
    },
    FavoritesRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.FavoritesPage());
    },
    MovieDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailsRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.MovieDetailsPage(
              key: args.key, movie: args.movie, heroKey: args.heroKey));
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(SplashRoute.name, path: '/'),
        _i6.RouteConfig(BottomBarRoute.name, path: '/bottom-bar-page'),
        _i6.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i6.RouteConfig(FavoritesRoute.name, path: '/favorites-page'),
        _i6.RouteConfig(MovieDetailsRoute.name, path: '/movie-details-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.BottomBarPage]
class BottomBarRoute extends _i6.PageRouteInfo<void> {
  const BottomBarRoute() : super(BottomBarRoute.name, path: '/bottom-bar-page');

  static const String name = 'BottomBarRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.FavoritesPage]
class FavoritesRoute extends _i6.PageRouteInfo<void> {
  const FavoritesRoute() : super(FavoritesRoute.name, path: '/favorites-page');

  static const String name = 'FavoritesRoute';
}

/// generated route for
/// [_i5.MovieDetailsPage]
class MovieDetailsRoute extends _i6.PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute(
      {_i7.Key? key, required _i8.MovieModel movie, required String heroKey})
      : super(MovieDetailsRoute.name,
            path: '/movie-details-page',
            args: MovieDetailsRouteArgs(
                key: key, movie: movie, heroKey: heroKey));

  static const String name = 'MovieDetailsRoute';
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs(
      {this.key, required this.movie, required this.heroKey});

  final _i7.Key? key;

  final _i8.MovieModel movie;

  final String heroKey;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, movie: $movie, heroKey: $heroKey}';
  }
}
