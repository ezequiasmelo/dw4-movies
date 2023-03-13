import 'package:dw4_movies_app/modules/auth/signup/signup_controller.dart';
import 'package:dw4_movies_app/repositories/auth/auth_repository.dart';
import 'package:dw4_movies_app/repositories/auth/auth_repository_impl.dart';
import 'package:dw4_movies_app/services/auth/iauth_service.dart';
import 'package:dw4_movies_app/services/auth/iauth_service_impl.dart';
import 'package:get/get.dart';

class SignUpBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(restClient: Get.find()),
    );
    Get.lazyPut<IAuthService>(
      () => IAuthServiceImpl(authRepository: Get.find()),
    );
    Get.lazyPut(
      () => SignUpController(iauthService: Get.find()),
    );
  }
}
