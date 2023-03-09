import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/app_constants.dart';
import '../constants/app_routes.dart';

class AuthService extends GetxService {
  final _storage = GetStorage();
  final _isLogged = RxnBool();

  Future<AuthService> init() async {
    _storage.listenKey(AppConstants.USER_KEY, (value) {
      _isLogged(value != null);
    });

    ever<bool?>(_isLogged, (isLogged) {
      if (isLogged != null && isLogged) {
        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.offAllNamed(AppRoutes.login);
      }
    });

    _isLogged(getUserId() != null);

    return this;
  }

  void logout() => _storage.remove(AppConstants.USER_KEY);

  int? getUserId() => _storage.read(AppConstants.USER_KEY);
}
