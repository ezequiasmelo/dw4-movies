import 'dart:developer';

import 'package:dw4_movies_app/application/ui/loader/loader_mixin.dart';
import 'package:dw4_movies_app/application/ui/messages/messages_mixin.dart';
import 'package:dw4_movies_app/models/movie_detail_model.dart';
import 'package:dw4_movies_app/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController
    with LoaderMixin, MessagesMixin {
  final MoviesService _moviesService;

  var loading = false.obs;
  var message = Rxn<MessageModel>();
  var movie = Rxn<MovieDetailModel>();

  MovieDetailController({required MoviesService moviesService})
      : _moviesService = moviesService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      final movieId = Get.arguments;
      loading(true);
      final movieDetailData = await _moviesService.getDetail(movieId);
      movie(movieDetailData);
      loading(false);
    } catch (e, s) {
      log('Erro ao buscar detalhe do filme', error: e, stackTrace: s);
      message(
        MessageModel.error(
            title: 'Erro', message: 'Erro ao buscar detalhe do filme'),
      );
    }
  }
}
