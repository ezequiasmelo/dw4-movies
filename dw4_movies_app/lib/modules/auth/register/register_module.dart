import 'package:dw4_movies_app/application/modules/module.dart';
import 'package:dw4_movies_app/modules/auth/register/register_bindings.dart';
import 'package:dw4_movies_app/modules/auth/register/register_page.dart';
import 'package:get/get.dart';

class RegisterModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/auth/register',
      page: () => const RegisterPage(),
      binding: RegisterBindings(),
    ),
  ];
}
