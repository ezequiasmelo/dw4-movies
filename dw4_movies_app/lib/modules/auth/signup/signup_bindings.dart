import 'package:dw4_movies_app/modules/auth/signup/signup_controller.dart';
import 'package:dw4_movies_app/repositories/auth/auth_repository.dart';
import 'package:dw4_movies_app/repositories/auth/auth_repository_impl.dart';
import 'package:get/get.dart';

class SignUpBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(restClient: Get.find()),
    );
    Get.lazyPut(() => SignUpController(authRepository: Get.find()));
  }
}
