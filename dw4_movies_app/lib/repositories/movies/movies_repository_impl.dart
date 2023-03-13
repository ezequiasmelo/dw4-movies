import 'dart:developer';

import '../../application/config/env/env.dart';
import '../../application/exceptions/rest_client_exception.dart';
import '../../application/rest_client/rest_client_themoviedb.dart';
import '../../models/movie_detail_model.dart';
import '../../models/movie_model.dart';
import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClientTheMovieDB _restClientTheMovieDB;

  MoviesRepositoryImpl({
    required RestClientTheMovieDB restClientTheMovieDB,
  }) : _restClientTheMovieDB = restClientTheMovieDB;

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await _restClientTheMovieDB.get('/movie/popular', query: {
      'api_key': Env.i['api_key_themoviedb'] ?? '',
      'language': 'pt-br',
      'page': '1',
    });

    if (result.hasError) {
      log(
        'Erro ao buscar popular movies (${result.statusCode})',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao buscar popular movies');
    }

    return result.body['results']
        .map<MovieModel>((v) => MovieModel.fromMap(v))
        .toList();
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final result = await _restClientTheMovieDB.get(
      '/movie/top_rated',
      query: {
        'api_key': Env.i['api_key_themoviedb'] ?? '',
        'language': 'pt-br',
        'page': '1',
      },
    );

    if (result.hasError) {
      log(
        'Erro ao buscar popular movies (${result.statusCode})',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao buscar popular movies');
    }

    return result.body['results']
        .map<MovieModel>((v) => MovieModel.fromMap(v))
        .toList();
  }

  @override
  Future<MovieDetailModel?> getDetail(int id) async {
    final result = await _restClientTheMovieDB.get(
      '/movie/$id',
      query: {
        'api_key': Env.i['api_key_themoviedb'] ?? '',
        'language': 'pt-br',
        'append_to_response': 'images,credits',
        'include_image_language': 'en,pt-br',
      },
    );

    if (result.hasError) {
      log(
        'Erro ao buscar detalhes do filme (${result.statusCode})',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao buscar detalhes do filme');
    }

    return MovieDetailModel.fromMap(result.body);
  }

  @override
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie) async {
    // TODO: implement getFavoritesMovies
  }

  @override
  Future<List<MovieModel>> getFavoritesMovies(String userId) async {
    // TODO: implement getFavoritesMovies
    return <MovieModel>[];
  }
}
