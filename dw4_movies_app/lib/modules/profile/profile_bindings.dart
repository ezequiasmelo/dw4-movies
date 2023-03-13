import 'package:get/get.dart';
import '../../repositories/profile/profile_repository.dart';
import '../../repositories/profile/profile_repository_impl.dart';
import '../../services/profile/profile_service.dart';
import '../../services/profile/profile_service_impl.dart';
import './profile_controller.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileRepository>(
      () => ProfileRepositoryImpl(restClient: Get.find()),
    );
    Get.lazyPut<ProfileService>(
      () => ProfileServiceImpl(profileRepository: Get.find()),
    );
    Get.put(
      ProfileController(profileService: Get.find()),
    );
  }
}
