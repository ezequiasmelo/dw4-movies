import 'package:dw4_movies_app/modules/auth/login/login_controller.dart';
import 'package:dw4_movies_app/services/auth/iauth_service.dart';
import 'package:dw4_movies_app/services/auth/iauth_service_impl.dart';
import 'package:get/get.dart';

import '../../../repositories/auth/auth_repository.dart';
import '../../../repositories/auth/auth_repository_impl.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(restClient: Get.find()),
    );
    Get.lazyPut<IAuthService>(
      () => IAuthServiceImpl(authRepository: Get.find()),
    );
    Get.lazyPut(
      () => LoginController(iAuthService: Get.find()),
    );
  }
}
