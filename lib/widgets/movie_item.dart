import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/provider/favorite_movies_provider.dart';
import 'package:movie_app/utils/routes/app_router.gr.dart';
import 'package:movie_app/widgets/app_image_network.dart';
import 'package:movie_app/widgets/loading_movie.dart';

class MovieItem extends StatelessWidget {
  final MovieModel movie;
  final String heroKey;
  const MovieItem({
    Key? key,
    required this.movie,
    required this.heroKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElasticIn(
      child: GestureDetector(
        onTap: () => context.pushRoute(MovieDetailsRoute(
          movie: movie,
          heroKey: '$heroKey${movie.id}',
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: AppImageNetwork(
                  imageUrl: movie.posterPath ?? movie.backdropPath,
                  loadingWidget: const LoadingMovie(),
                  width: 150,
                ),
              ),
              Positioned(
                  right: 10,
                  top: 10,
                  child: Consumer(builder: (context, ref, child) {
                    final favoriteMovies = ref.watch(favoriteProvider);

                    return InkWell(
                        onTap: () {
                          ref
                              .read(favoriteProvider.notifier)
                              .addMovieToFavorite(movie);
                        },
                        child: SvgPicture.asset(
                            favoriteMovies.isFavorite(movie.id)
                                ? 'assets/images/red_icon_button.svg'
                                : 'assets/images/like_icon.svg'));
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
