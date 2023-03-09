import 'package:dw4_movies_app/application/modules/module.dart';
import 'package:dw4_movies_app/modules/auth/signup/signup_bindings.dart';
import 'package:dw4_movies_app/modules/auth/signup/signup_page.dart';
import 'package:get/get.dart';

class SignUpModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/auth/signup',
      page: () => const SignUpPage(),
      binding: SignUpBindings(),
    ),
  ];
}
