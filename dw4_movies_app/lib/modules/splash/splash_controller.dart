import 'package:dw4_movies_app/application/services/auth_service.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Get.putAsync(() => AuthService().init());
  }
}
