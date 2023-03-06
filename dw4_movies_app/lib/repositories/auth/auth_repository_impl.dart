import 'dart:developer';

import 'package:dw4_movies_app/application/exceptions/user_not_found_exception.dart';
import 'package:dw4_movies_app/application/rest_client/rest_client.dart';
import 'package:dw4_movies_app/models/user_model.dart';

import '../../application/exceptions/rest_client_exception.dart';
import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restClient;

  AuthRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient.post('/auth', {
      'email': email,
      'password': password,
    });

    if (result.hasError) {
      if (result.statusCode == 403) {
        log(
          'Usuário ou senha inválidos',
          error: result.statusText,
          stackTrace: StackTrace.current,
        );
        throw UserNotFoundException();
      }

      log(
        'Erro ao autenticar usuário (${result.statusCode})',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao autenticar usuário');
    }

    return UserModel.fromMap(result.body);
  }

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final result = await _restClient.post('/auth/register', {
      'name': name,
      'email': email,
      'password': password,
    });

    if (result.hasError) {
      var message = 'Erro ao registrar usuário';
      if (result.statusCode == 400) {
        message = result.body['error'];
      }

      log(message, error: result.statusText, stackTrace: StackTrace.current);
      throw RestClientException(message);
    }

    return login(email, password);
  }

  @override
  Future<void> logout() async {
    log('logout');
  }
}
