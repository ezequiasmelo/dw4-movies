import 'package:dw4_movies_app/models/movie_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieDetailHeader extends StatelessWidget {
  final MovieDetailModel? movie;

  const MovieDetailHeader({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieData = movie;
    if (movieData != null) {
      return SizedBox(
        height: 278,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movieData.urlImages.length,
          itemBuilder: (context, index) {
            final image = movieData.urlImages[index];
            return Padding(
              padding: EdgeInsets.all(2),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: image,
              ),
            );
          },
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
