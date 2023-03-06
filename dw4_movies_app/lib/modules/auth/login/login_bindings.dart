import 'package:dw4_movies_app/modules/auth/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(authService: Get.find()));
  }
}
