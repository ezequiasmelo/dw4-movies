import 'package:dw4_movies_app/modules/auth/login/login_bindings.dart';
import 'package:dw4_movies_app/modules/auth/login/login_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../../application/modules/module.dart';

class LoginModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/auth/login',
      page: () => const LoginPage(),
      binding: LoginBindings(),
    ),
  ];
}
