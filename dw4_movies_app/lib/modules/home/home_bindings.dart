import 'package:dw4_movies_app/modules/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(authService: Get.find()),
      fenix: true,
    );
  }
}
