import 'package:flutter/material.dart';
import 'package:movie_app/widgets/loading_movie.dart';

class LoadingListMovies extends StatelessWidget {
  const LoadingListMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: LoadingMovie(),
          );
        },
      ),
    );
  }
}
