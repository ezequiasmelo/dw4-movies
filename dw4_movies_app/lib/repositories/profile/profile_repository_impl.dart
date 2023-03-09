import 'package:dw4_movies_app/application/rest_client/rest_client.dart';

import './profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final RestClient _restClient;

  ProfileRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<void> updateNameProfile(String name) {
    // TODO: implement updateNameProfile
    throw UnimplementedError();
  }
}
