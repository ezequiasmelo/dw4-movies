import 'dart:developer';

import 'package:dw4_movies_app/application/mixins/loader_mixin.dart';
import 'package:dw4_movies_app/application/mixins/messages_mixin.dart';
import 'package:dw4_movies_app/models/user_model.dart';
import 'package:dw4_movies_app/services/profile/profile_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController with LoaderMixin, MessagesMixin {
  final ProfileService _profileService;

  final _isLoading = false.obs;
  final _message = Rxn<MessageModel>();

  final profile = Rxn<UserModel>();

  ProfileController({
    required ProfileService profileService,
  }) : _profileService = profileService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_isLoading);
    messageListener(_message);
  }

  @override
  void onReady() async {
    super.onReady();
    getProfile();
  }

  Future<void> getProfile() async {
    try {
      _isLoading.toggle();
      final result = await _profileService.getProfile();
      profile(result);
      _isLoading.toggle();
    } catch (e, s) {
      _isLoading.toggle();
      log('Erro ao buscar perfil do usuário', error: e, stackTrace: s);
      _message(
        MessageModel.error(
            title: 'Erro', message: 'Erro ao buscar perfil do usuário'),
      );
    }

    // final storage = GetStorage();
    // log('message');
    // log('USER_KEY ' + storage.read(AppConstants.USER_KEY).toString());
    // log('ACCESS_TOKEN ' + storage.read(AppConstants.ACCESS_TOKEN));
    // log('REFRESH_TOKEN ' + storage.read(AppConstants.REFRESH_TOKEN));
  }
}
