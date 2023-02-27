import 'package:dw4_movies_app/modules/splash/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../application/modules/module.dart';
import 'splash_bindings.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => const SplashPage(),
      binding: SplashBindings(),
    ),
  ];
}
