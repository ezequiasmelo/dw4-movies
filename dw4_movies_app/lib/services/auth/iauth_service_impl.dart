import 'package:dw4_movies_app/repositories/auth/auth_repository.dart';

import '../../models/user_model.dart';
import 'iauth_service.dart';

class IAuthServiceImpl implements IAuthService {
  final AuthRepository _authRepository;

  IAuthServiceImpl({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<UserModel> login(String email, String password) =>
      _authRepository.login(email, password);

  @override
  Future<UserModel> register(String name, String email, String password) =>
      _authRepository.register(name, email, password);

  @override
  Future<void> logout() => _authRepository.logout();
}
