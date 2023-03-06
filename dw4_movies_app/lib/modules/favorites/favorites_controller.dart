import 'package:dw4_movies_app/models/movie_model.dart';
import 'package:get/get.dart';

import 'package:dw4_movies_app/application/auth/auth_service.dart';
import 'package:dw4_movies_app/services/movies/movies_service.dart';

class FavoritesController extends GetxController {
  final MoviesService _moviesService;
  final AuthService _authService;

  var movies = <MovieModel>[].obs;

  FavoritesController({
    required MoviesService moviesService,
    required AuthService authService,
  })  : _moviesService = moviesService,
        _authService = authService;

  @override
  void onReady() {
    super.onReady();
    _getFavorites();
  }

  Future<void> _getFavorites() async {
    var user = _authService; // var user = _authService.auth;
    if (user != null) {
      var favorites = await _moviesService.getFavoritesMovies(
          '1'); // await _moviesService.getFavoritesMovies(user.id.toString());
      movies.assignAll(favorites);
    }
  }

  Future<void> removeFavorite(MovieModel movie) async {
    var user = _authService; // var user = _authService.auth;
    if (user != null) {
      await _moviesService.addOrRemoveFavorite(
          '1',
          movie.copyWith(
              favorite:
                  false)); // user.id.toString(), movie.copyWith(favorite: false));
      movies.remove(movie);
    }
  }
}
