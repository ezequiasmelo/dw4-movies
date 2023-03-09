import 'dart:developer';

import 'package:dw4_movies_app/application/mixins/loader_mixin.dart';
import 'package:dw4_movies_app/application/mixins/messages_mixin.dart';
import 'package:dw4_movies_app/models/movie_detail_model.dart';
import 'package:dw4_movies_app/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController
    with LoaderMixin, MessagesMixin {
  final MoviesService _moviesService;

  var _loading = false.obs;
  var _message = Rxn<MessageModel>();
  var movie = Rxn<MovieDetailModel>();

  MovieDetailController({
    required MoviesService moviesService,
  }) : _moviesService = moviesService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      final movieId = Get.arguments;
      _loading(true);
      final movieDetailData = await _moviesService.getDetail(movieId);
      movie(movieDetailData);
      _loading(false);
    } catch (e, s) {
      log('Erro ao buscar detalhe do filme', error: e, stackTrace: s);
      _message(
        MessageModel.error(
            title: 'Erro', message: 'Erro ao buscar detalhe do filme'),
      );
    }
  }
}
