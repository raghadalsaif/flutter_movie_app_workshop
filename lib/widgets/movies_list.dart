import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/widgets/movie_item.dart';

class MoviesList extends StatelessWidget {
  final List<MovieModel> movies;
  final String heroKey;
  const MoviesList({
    Key? key,
    required this.movies,
    required this.heroKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: movies.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        itemBuilder: (context, index) {
          return MovieItem(
            movie: movies[index],
            heroKey: heroKey,
          );
        },
      ),
    );
  }
}
