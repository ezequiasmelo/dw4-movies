import 'package:dw4_movies_app/application/bindings/application_bindings.dart';
import 'package:dw4_movies_app/application/config/env/env.dart';
import 'package:dw4_movies_app/application/ui/filmes_app_ui_config.dart';
import 'package:dw4_movies_app/modules/auth/signup/signup_module.dart';
import 'package:dw4_movies_app/modules/home/home_module.dart';
import 'package:dw4_movies_app/modules/auth/login/login_module.dart';
import 'package:dw4_movies_app/modules/movie_detail/movie_detail_module.dart';
import 'package:dw4_movies_app/modules/splash/splash_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  await Env.i.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: FilmesAppUiConfig.title,
      debugShowCheckedModeBanner: false,
      initialBinding: ApplicationBindings(),
      theme: FilmesAppUiConfig.theme,
      getPages: [
        ...SplashModule().routers,
        ...LoginModule().routers,
        ...SignUpModule().routers,
        ...HomeModule().routers,
        ...MovieDetailModule().routers,
      ],
    );
  }
}
