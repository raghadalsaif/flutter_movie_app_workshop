import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/cast_model.dart';
import 'package:movie_app/utils/constants/app_constants.dart';
import 'package:movie_app/utils/routes/app_router.gr.dart';
import 'package:movie_app/widgets/app_image_network.dart';
import 'package:movie_app/widgets/loading_movie.dart';

class CastList extends StatelessWidget {
  final List<CastModel> cast;
  const CastList({
    Key? key,
    required this.cast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: cast.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        itemBuilder: (context, index) {
          return ElasticIn(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: AppImageNetwork(
                      imageUrl: AppConstants.baseImageUrl +
                          (cast[index].profilePath ?? ''),
                      loadingWidget: const LoadingMovie(),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          cast[index].name,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
