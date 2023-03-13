import '../../models/user_model.dart';

abstract class ProfileService {
  Future<UserModel> getProfile();
  Future<void> updateNameProfile(String name);
}
