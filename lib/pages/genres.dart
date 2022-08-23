import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/provider/genre_provider.dart';
import 'package:movie_app/provider/selected_genre.dart';
import 'package:movie_app/utils/theme/app_colors.dart';

class Genres extends ConsumerStatefulWidget {
  const Genres({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _GenresState();
}

class _GenresState extends ConsumerState<Genres> {
  @override
  Widget build(BuildContext context) {
    final genreState = ref.watch(genreProvider);
    return genreState.when(
        data: (genres) {
          final selectedGenre = ref.watch(selectedGenreProvider);
          return SizedBox(
            height: 40,
            child: ListView.builder(
              itemCount: genres.length,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    ref.read(selectedGenreProvider.state).state = genres[index];
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                      15,
                    )),
                    shadowColor: AppColors.orange.withOpacity(0.5),
                    elevation: selectedGenre?.id == genres[index].id ? 2 : 0,
                    color: selectedGenre?.id == genres[index].id
                        ? AppColors.orange
                        : Colors.white,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Text(
                        genres[index].name,
                        style: TextStyle(
                          color: selectedGenre?.id == genres[index].id
                              ? Colors.white
                              : AppColors.blue,
                        ),
                      ),
                    )),
                  ),
                );
              },
            ),
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const CircularProgressIndicator());
  }
}
