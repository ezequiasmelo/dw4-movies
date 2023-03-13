import 'dart:developer';

import '../../application/config/env/env.dart';
import '../../application/exceptions/rest_client_exception.dart';
import '../../application/rest_client/rest_client_themoviedb.dart';
import '../../models/genre_model.dart';
import './genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final RestClientTheMovieDB _restClientTheMovieDB;

  GenresRepositoryImpl({
    required RestClientTheMovieDB restClientTheMovieDB,
  }) : _restClientTheMovieDB = restClientTheMovieDB;

  @override
  Future<List<GenreModel>> getGenres() async {
    final result = await _restClientTheMovieDB.get(
      '/genre/movie/list',
      query: {
        'api_key': Env.i['api_key_themoviedb'] ?? '',
        'language': 'pt-br',
      },
    );

    if (result.hasError) {
      log(
        'Erro ao buscar Genres (${result.statusCode})',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao buscar Genres');
    }

    return result.body['genres']
        .map<GenreModel>((g) => GenreModel.fromMap(g))
        .toList();
  }
}
