import 'package:dw4_movies_app/modules/movies/movies_controller.dart';
import 'package:dw4_movies_app/repositories/genres/genres_repository.dart';
import 'package:dw4_movies_app/repositories/genres/genres_repository_impl.dart';
import 'package:dw4_movies_app/services/genres/genres_service.dart';
import 'package:dw4_movies_app/services/genres/genres_service_impl.dart';
import 'package:get/get.dart';

class MoviesBindigs implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenresRepository>(
      () => GenresRepositoryImpl(restClient: Get.find()),
    );
    Get.lazyPut<GenresService>(
      () => GenresServiceImpl(genresRepository: Get.find()),
    );
    Get.lazyPut<MoviesController>(
      () => MoviesController(
        genresService: Get.find(),
        moviesService: Get.find(),
        authService: Get.find(),
      ),
    );
  }
}
