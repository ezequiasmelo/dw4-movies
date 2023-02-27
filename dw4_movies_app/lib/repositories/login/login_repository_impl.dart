import 'dart:developer';

import './login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<bool> login() async {
    return true;
  }

  @override
  Future<void> logout() async {
    log('logout');
  }
}
