import 'package:dw4_movies_app/repositories/profile/profile_repository.dart';
import 'package:dw4_movies_app/repositories/profile/profile_repository_impl.dart';
import 'package:dw4_movies_app/services/profile/profile_service.dart';
import 'package:dw4_movies_app/services/profile/profile_service_impl.dart';
import 'package:get/get.dart';
import './profile_update_name_controller.dart';

class ProfileUpdateNameBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileRepository>(
      () => ProfileRepositoryImpl(restClient: Get.find()),
    );
    Get.lazyPut<ProfileService>(
      () => ProfileServiceImpl(profileRepository: Get.find()),
    );
    Get.lazyPut(
      () => ProfileUpdateNameController(profileService: Get.find()),
    );
  }
}
