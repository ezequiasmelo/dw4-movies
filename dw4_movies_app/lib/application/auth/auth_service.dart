import 'package:dw4_movies_app/application/auth/auth_model.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  AuthModel? auth;

  void init() {
    final user = AuthModel(id: 1, name: 'ezequias');
    auth = user;
    // TODO: ainda esta na splash controller
    // if (user == null) {
    //   Get.offAllNamed('/login');
    // }
    //else {
    // Get.offAllNamed('/home');
    // }
  }
}
