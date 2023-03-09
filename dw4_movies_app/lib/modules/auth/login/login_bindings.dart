import 'package:dw4_movies_app/modules/auth/login/login_controller.dart';
import 'package:get/get.dart';

import '../../../repositories/auth/auth_repository.dart';
import '../../../repositories/auth/auth_repository_impl.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(restClient: Get.find()),
    );
    Get.lazyPut(() => LoginController(authRepository: Get.find()));
  }
}
