import 'package:dw4_movies_app/repositories/profile/profile_repository.dart';

import './profile_service.dart';

class ProfileServiceImpl implements ProfileService {
  final ProfileRepository _profileRepository;

  ProfileServiceImpl({
    required ProfileRepository profileRepository,
  }) : _profileRepository = profileRepository;

  @override
  Future<void> updateNameProfile(String name) =>
      _profileRepository.updateNameProfile(name);
}
