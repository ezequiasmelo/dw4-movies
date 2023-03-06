import 'package:dw4_movies_app/application/auth/auth_service.dart';
import 'package:dw4_movies_app/application/rest_client/rest_client.dart';
import 'package:dw4_movies_app/repositories/auth/auth_repository.dart';
import 'package:dw4_movies_app/repositories/auth/auth_repository_impl.dart';
import 'package:dw4_movies_app/repositories/movies/movies_repository.dart';
import 'package:dw4_movies_app/services/auth/auth_service.dart';
import 'package:dw4_movies_app/services/auth/auth_service_impl.dart';
import 'package:dw4_movies_app/services/movies/movies_service_impl.dart';
import 'package:get/get.dart';

import '../../repositories/movies/movies_repository_impl.dart';
import '../../services/movies/movies_service.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient(), fenix: true);
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(restClient: Get.find()),
      fenix: true,
    );
    Get.lazyPut<IAuthService>(
      () => AuthServiceImpl(authRepository: Get.find()),
      fenix: true,
    );
    Get.put(AuthService()).init();
    Get.lazyPut<MoviesRepository>(
        () => MoviesRepositoryImpl(restClient: Get.find()),
        fenix: true);
    Get.lazyPut<MoviesService>(
        () => MoviesServiceImpl(moviesRepository: Get.find()),
        fenix: true);
  }
}
