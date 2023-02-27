import 'dart:developer';

import 'package:dw4_movies_app/application/rest_client/rest_client.dart';
import 'package:dw4_movies_app/models/genre_model.dart';

import '../../application/config/env/env.dart';
import './genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final RestClient _restClient;

  GenresRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<GenreModel>> getGenres() async {
    final result = await _restClient.get<List<GenreModel>>(
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
      log('Erro ao buscar Genres [${result.statusText}]');
      throw Exception('Erro ao buscar Genres');
    }

    return result.body ?? <GenreModel>[];
  }
}
