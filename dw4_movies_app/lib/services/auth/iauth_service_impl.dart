import '../../models/tokenization_model.dart';
import '../../repositories/auth/auth_repository.dart';
import 'iauth_service.dart';

class IAuthServiceImpl implements IAuthService {
  final AuthRepository _authRepository;

  IAuthServiceImpl({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<TokenizationModel> login(String email, String password) =>
      _authRepository.login(email, password);

  @override
  Future<TokenizationModel> register(
          String name, String email, String password) =>
      _authRepository.register(name, email, password);

  @override
  Future<void> logout() => _authRepository.logout();
}
