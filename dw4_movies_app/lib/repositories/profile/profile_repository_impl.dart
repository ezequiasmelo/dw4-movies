import 'dart:developer';

import '../../application/rest_client/rest_client.dart';
import '../../models/user_model.dart';
import './profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final RestClient _restClient;

  ProfileRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<UserModel> getProfile() async {
    final result = await _restClient.get('/user');

    if (result.hasError) {
      log(
        'Erro ao buscar profile (${result.statusText})',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw Exception('Erro ao buscar profile');
    }

    return UserModel.fromMap(result.body);
  }

  @override
  Future<void> updateNameProfile(String name) {
    // TODO: implement updateNameProfile
    throw UnimplementedError();
  }
}
