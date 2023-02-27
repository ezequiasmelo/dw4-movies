import 'package:dw4_movies_app/repositories/login/login_repository.dart';

import './login_service.dart';

class LoginServiceImpl implements LoginService {
  final LoginRepository _loginRepository;

  LoginServiceImpl({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository;

  @override
  Future<bool> login() => _loginRepository.login();

  @override
  Future<void> logout() => _loginRepository.logout();
}
