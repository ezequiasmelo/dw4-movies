import 'dart:developer';

import 'package:dw4_movies_app/application/exceptions/rest_client_exception.dart';
import 'package:dw4_movies_app/application/rest_client/rest_client_themoviedb.dart';
import 'package:dw4_movies_app/models/genre_model.dart';

import '../../application/config/env/env.dart';
import './genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final RestClientTheMovieDB _restClientTheMovieDB;

  GenresRepositoryImpl({
    required RestClientTheMovieDB restClientTheMovieDB,
  }) : _restClientTheMovieDB = restClientTheMovieDB;

  @override
  Future<List<GenreModel>> getGenres() async {
    final result = await _restClientTheMovieDB.get<List<GenreModel>>(
      '/genre/movie/list',
      query: {
        'api_key': Env.i['api_key_themoviedb'] ?? '',
        'language': 'pt-br',
      },
      decoder: (data) {
        final resultData = data['genres'];
        if (resultData != null) {
          return resultData
              .map<GenreModel>((g) => GenreModel.fromMap(g))
              .toList();
        }
        return <GenreModel>[];
      },
    );

    if (result.hasError) {
      log(
        'Erro ao buscar Genres (${result.statusText})',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao buscar Genres');
    }

    return result.body ?? <GenreModel>[];
  }
}
