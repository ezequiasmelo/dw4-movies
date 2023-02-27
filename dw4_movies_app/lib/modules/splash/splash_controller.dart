import 'package:get/get.dart';

class SplashController extends GetxController {
  // TODO: pode remover isso se no auth_service estiver funcionando
  @override
  void onReady() {
    super.onReady();
    // Get.offAllNamed('/login');
    Get.offAllNamed('/home');
  }
}
