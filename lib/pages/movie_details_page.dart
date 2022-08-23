import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/pages/cast.dart';
import 'package:movie_app/pages/similar_movies.dart';
import 'package:movie_app/utils/constants/app_constants.dart';
import 'package:movie_app/utils/theme/app_colors.dart';
import 'package:movie_app/widgets/app_image_network.dart';

class MovieDetailsPage extends StatelessWidget {
  final MovieModel movie;
  final String heroKey;
  const MovieDetailsPage({
    Key? key,
    required this.movie,
    required this.heroKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            stretch: true,
            floating: true,
            leading: Center(
              child: GestureDetector(
                onTap: () => context.popRoute(),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 2),
                      blurRadius: 10,
                      color: AppColors.primary,
                    )
                  ],
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0, 2),
                      blurRadius: 10,
                      color: AppColors.primary,
                    )
                  ]),
                ),
              ),
              background: Hero(
                tag: heroKey,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: AppImageNetwork(
                    imageUrl: movie.backdropPath ?? movie.posterPath,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.symmetric(vertical: 15)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/images/star_icon.svg',
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: movie.voteAverage.toStringAsFixed(1),
                            style: const TextStyle(
                                fontSize: 18, fontFamily: 'Montserrat')),
                        const TextSpan(
                            text: '/10',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                            )),
                      ])),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Reviews',
                  ),
                  Text(
                    '${movie.voteCount} user',
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Text(movie.overview),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Text(
                'Cast',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Cast(movieID: movie.id),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Text(
                'Similar Movies',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SimilarMovies(movieId: movie.id),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 20),
          ),
        ],
      ),
    );
  }
}
