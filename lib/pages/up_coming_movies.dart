import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/provider/favorite_movies_provider.dart';
import 'package:movie_app/provider/up_coming_movie_provider.dart';
import 'package:movie_app/utils/constants/app_constants.dart';
import 'package:movie_app/utils/routes/app_router.gr.dart';
import 'package:movie_app/widgets/app_image_network.dart';
import 'package:movie_app/widgets/loading_slider.dart';

class UpComingMovies extends ConsumerStatefulWidget {
  const UpComingMovies({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _NowPlayingMoviesState();
}

class _NowPlayingMoviesState extends ConsumerState<UpComingMovies> {
  @override
  Widget build(BuildContext context) {
    final upComingState = ref.watch(upComingMovieProvider);

    return upComingState.when(
        data: (movies) {
          return CarouselSlider.builder(
            itemCount: movies.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    GestureDetector(
              onTap: () => context.pushRoute(MovieDetailsRoute(
                  movie: movies[itemIndex],
                  heroKey:
                      '${AppConstants.nowPlaying}${movies[itemIndex].id}')),
              child: Hero(
                tag: '${AppConstants.nowPlaying}${movies[itemIndex].id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  child: AppImageNetwork(
                    imageUrl: movies[itemIndex].backdropPath ??
                        movies[itemIndex].posterPath,
                    width: double.infinity,
                    loadingWidget: const LoadingSlider(),
                  ),
                ),
              ),
            ),
            options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlay: true,
            ),
          );
        },
        error: (error, stackTrace) => Text(
              error.toString(),
            ),
        loading: () => CarouselSlider.builder(
              itemCount: 3,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      ClipRRect(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                child: const LoadingSlider(),
              ),
              options: CarouselOptions(
                enlargeCenterPage: true,
              ),
            ));
  }
}
