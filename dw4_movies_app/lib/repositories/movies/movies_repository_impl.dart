import 'dart:developer';

import 'package:dw4_movies_app/application/exceptions/rest_client_exception.dart';
import 'package:dw4_movies_app/application/rest_client/rest_client_themoviedb.dart';
import 'package:dw4_movies_app/models/movie_detail_model.dart';
import 'package:dw4_movies_app/models/movie_model.dart';

import '../../application/config/env/env.dart';
import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClientTheMovieDB _restClientTheMovieDB;

  MoviesRepositoryImpl({
    required RestClientTheMovieDB restClientTheMovieDB,
  }) : _restClientTheMovieDB = restClientTheMovieDB;

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await _restClientTheMovieDB.get<List<MovieModel>>(
      '/movie/popular',
      query: {
        'api_key': Env.i['api_key_themoviedb'] ?? '',
        'language': 'pt-br',
        'page': '1',
      },
      decoder: (data) {
        final results = data['results'];
        if (results != null) {
          return results.map<MovieModel>((v) => MovieModel.fromMap(v)).toList();
        }

        return <MovieModel>[];
      },
    );

    if (result.hasError) {
      log(
        'Erro ao buscar popular movies (${result.statusText})',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao buscar popular movies');
    }

    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final result = await _restClientTheMovieDB.get<List<MovieModel>>(
      '/movie/top_rated',
      query: {
        'api_key': Env.i['api_key_themoviedb'] ?? '',
        'language': 'pt-br',
        'page': '1',
      },
      decoder: (data) {
        final results = data['results'];
        if (results != null) {
          return results.map<MovieModel>((v) => MovieModel.fromMap(v)).toList();
        }

        return <MovieModel>[];
      },
    );

    if (result.hasError) {
      log(
        'Erro ao buscar popular movies (${result.statusText})',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao buscar popular movies');
    }

    return result.body ?? <MovieModel>[];
  }

  @override
  Future<MovieDetailModel?> getDetail(int id) async {
    final result = await _restClientTheMovieDB.get<MovieDetailModel?>(
      '/movie/$id',
      query: {
        'api_key': Env.i['api_key_themoviedb'] ?? '',
        'language': 'pt-br',
        'append_to_response': 'images,credits',
        'include_image_language': 'en,pt-br',
      },
      decoder: (data) {
        return MovieDetailModel.fromMap(data);
      },
    );

    if (result.hasError) {
      log(
        'Erro ao buscar detalhes do filme (${result.statusText})',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao buscar detalhes do filme');
    }

    return result.body;
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
