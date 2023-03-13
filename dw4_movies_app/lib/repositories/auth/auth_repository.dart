import '../../models/tokenization_model.dart';

abstract class AuthRepository {
  Future<TokenizationModel> login(String email, String password);
  Future<TokenizationModel> register(
      String name, String email, String password);
  Future<void> logout();
}
