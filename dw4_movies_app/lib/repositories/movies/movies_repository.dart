import 'package:dw4_movies_app/models/movie_model.dart';

import '../../models/movie_detail_model.dart';

abstract class MoviesRepository {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailModel?> getDetail(int id);
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie);
  Future<List<MovieModel>> getFavoritesMovies(String userId);
}
