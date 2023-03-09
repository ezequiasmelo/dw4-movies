import 'dart:developer';

import 'package:dw4_movies_app/application/exceptions/rest_client_exception.dart';
import 'package:dw4_movies_app/application/mixins/loader_mixin.dart';
import 'package:dw4_movies_app/application/mixins/messages_mixin.dart';
import 'package:dw4_movies_app/services/profile/profile_service.dart';
import 'package:get/get.dart';

class ProfileUpdateNameController extends GetxController
    with LoaderMixin, MessagesMixin {
  final ProfileService _profileService;

  final _isLoading = false.obs;
  final _message = Rxn<MessageModel>();

  final formValid = false.obs;

  ProfileUpdateNameController({
    required ProfileService profileService,
  }) : _profileService = profileService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_isLoading);
    messageListener(_message);
  }

  Future<void> updateNameProfile(String name) async {
    try {
      _isLoading.toggle();
      await _profileService.updateNameProfile(name);
      _isLoading.toggle();
    } on RestClientException catch (e, s) {
      _isLoading.toggle();

      log('Erro ao atualizar nome do usuário', error: e.message, stackTrace: s);

      _message(MessageModel(
          title: 'Erro', message: e.message, type: MessageType.error));
    } catch (e, s) {
      _isLoading.toggle();

      log('Erro', error: 'Erro ao atualizar nome do usuário', stackTrace: s);

      _message(MessageModel(
          title: 'Erro',
          message: 'Erro ao atualizar nome do usuário',
          type: MessageType.error));
    }
  }
}
