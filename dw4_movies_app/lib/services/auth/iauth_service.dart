import 'package:dw4_movies_app/models/user_model.dart';

abstract class IAuthService {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String name, String email, String password);
  Future<void> logout();
}
