import '../../models/user_model.dart';
import '../../repositories/profile/profile_repository.dart';
import './profile_service.dart';

class ProfileServiceImpl implements ProfileService {
  final ProfileRepository _profileRepository;

  ProfileServiceImpl({
    required ProfileRepository profileRepository,
  }) : _profileRepository = profileRepository;

  @override
  Future<UserModel> getProfile() => _profileRepository.getProfile();

  @override
  Future<void> updateNameProfile(String name) =>
      _profileRepository.updateNameProfile(name);
}
