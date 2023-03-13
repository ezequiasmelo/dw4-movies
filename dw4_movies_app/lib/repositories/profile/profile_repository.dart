import '../../models/user_model.dart';

abstract class ProfileRepository {
  Future<UserModel> getProfile();
  Future<void> updateNameProfile(String name);
}
