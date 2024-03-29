import 'dart:developer';

import 'package:dw4_movies_app/application/mixins/loader_mixin.dart';
import 'package:dw4_movies_app/application/services/auth_service.dart';
import 'package:dw4_movies_app/application/mixins/messages_mixin.dart';
import 'package:dw4_movies_app/models/genre_model.dart';
import 'package:dw4_movies_app/models/movie_model.dart';
import 'package:dw4_movies_app/services/genres/genres_service.dart';
import 'package:dw4_movies_app/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController with LoaderMixin, MessagesMixin {
  final GenresService _genresService;
  final MoviesService _moviesService;
  final AuthService _authService;

  final _isLoading = false.obs;
  final _message = Rxn<MessageModel>();
  final genres = <GenreModel>[].obs;

  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  var _popularMoviesOriginal = <MovieModel>[];
  var _topRatedMoviesOriginal = <MovieModel>[];

  final genreSelected = Rxn<GenreModel>();

  MoviesController({
    required GenresService genresService,
    required MoviesService moviesService,
    required AuthService authService,
  })  : _genresService = genresService,
        _moviesService = moviesService,
        _authService = authService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_isLoading);
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    getGenres();
  }

  Future<void> getGenres() async {
    try {
      final genresData = await _genresService.getGenres();
      genres.assignAll(genresData);

      await getMovies(showLoader: true);
    } catch (e, s) {
      log('Erro ao carregar dados da pagina', error: e, stackTrace: s);
      _message(
        MessageModel.error(
            title: 'Erro', message: 'Erro ao carregar dados da pagina'),
      );
    }
  }

  Future<void> getMovies({bool showLoader = false}) async {
    try {
      if (showLoader) _isLoading.toggle();

      var popularMoviesData = await _moviesService.getPopularMovies();
      var topRatedMoviesData = await _moviesService.getTopRatedMovies();
      final favorites = await getFavorites();

      popularMoviesData = popularMoviesData.map((m) {
        if (favorites.containsKey(m.id)) {
          return m.copyWith(favorite: true);
        } else {
          return m.copyWith(favorite: false);
        }
      }).toList();

      topRatedMoviesData = topRatedMoviesData.map((m) {
        if (favorites.containsKey(m.id)) {
          return m.copyWith(favorite: true);
        } else {
          return m.copyWith(favorite: false);
        }
      }).toList();

      popularMovies.assignAll(popularMoviesData);
      _popularMoviesOriginal = popularMoviesData;

      topRatedMovies.assignAll(topRatedMoviesData);
      _topRatedMoviesOriginal = topRatedMoviesData;

      if (showLoader) _isLoading.toggle();
    } catch (e, s) {
      log('Erro ao carregar dados da pagina', error: e, stackTrace: s);
      _message(
        MessageModel.error(
            title: 'Erro', message: 'Erro ao carregar dados da pagina'),
      );
    }
  }

  void filterByName(String title) {
    if (title.isNotEmpty) {
      var newPopularMovies = _popularMoviesOriginal.where((movie) {
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });

      var newTopRatedMovies = _topRatedMoviesOriginal.where((movie) {
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });

      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }

  void filterMoviesByGenre(GenreModel? genreModel) {
    if (genreModel?.id == genreSelected.value?.id) {
      genreModel = null;
    }

    genreSelected.value = genreModel;

    if (genreModel != null) {
      var newPopularMovies = _popularMoviesOriginal.where((movie) {
        return movie.genres.contains(genreModel?.id);
      });

      var newTopRatedMovies = _topRatedMoviesOriginal.where((movie) {
        return movie.genres.contains(genreModel?.id);
      });

      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }

  Future<void> favoriteMovies(MovieModel movie) async {
    final user = _authService; // final user = _authService.auth;
    if (user != null) {}
  }

  Future<Map<int, MovieModel>> getFavorites() async {
    var user = _authService; // var user = _authService.auth;
    if (user != null) {
      final favorites = await _moviesService.getFavoritesMovies(
          '1'); // await _moviesService.getFavoritesMovies(user.id.toString());
      return <int, MovieModel>{
        for (var fav in favorites) fav.id: fav,
      };
    }

    return {};
  }
}
