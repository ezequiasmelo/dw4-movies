import 'package:dw4_movies_app/application/ui/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:dw4_movies_app/application/ui/filmes_app_icons_icons.dart';
import 'package:dw4_movies_app/models/movie_model.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../utils/formatter_utils.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  final VoidCallback favoriteCallback;

  MovieCard({
    Key? key,
    required this.movie,
    required this.favoriteCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          '/movie/detail',
          arguments: movie.id,
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        width: 148,
        height: 280,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAlias,
                    child: FadeInImage.memoryNetwork(
                      width: 148,
                      height: 184,
                      placeholder: kTransparentImage,
                      image:
                          'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  movie.title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  FormatterUtils.formatDate(movie.releaseDate, 'y'),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 70,
              right: -3,
              child: Material(
                elevation: 5,
                shape: CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: 30,
                  child: IconButton(
                    iconSize: 13,
                    onPressed: favoriteCallback,
                    icon: Icon(
                      movie.favorite
                          ? FilmesAppIcons.heart
                          : FilmesAppIcons.heart_empty,
                      color: movie.favorite ? context.themeRed : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
