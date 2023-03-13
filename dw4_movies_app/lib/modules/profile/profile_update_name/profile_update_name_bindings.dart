import 'package:get/get.dart';
import './profile_update_name_controller.dart';

class ProfileUpdateNameBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProfileUpdateNameController(profileService: Get.find()),
    );
  }
}
