import 'package:dw4_movies_app/application/bindings/application_bindings.dart';
import 'package:dw4_movies_app/application/config/env/env.dart';
import 'package:dw4_movies_app/application/ui/filmes_app_ui_config.dart';
import 'package:dw4_movies_app/modules/home/home_module.dart';
import 'package:dw4_movies_app/modules/login/login_module.dart';
import 'package:dw4_movies_app/modules/movie_detail/movie_detail_module.dart';
import 'package:dw4_movies_app/modules/splash/splash_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Future<void> main() async {
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
        ...HomeModule().routers,
        ...MovieDetailModule().routers,
      ],
    );
  }
}
