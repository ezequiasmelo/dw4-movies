import 'dart:developer';

import 'package:get/get.dart';

import 'package:dw4_movies_app/application/mixins/loader_mixin.dart';
import 'package:dw4_movies_app/application/mixins/messages_mixin.dart';
import 'package:dw4_movies_app/services/auth/auth_service.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final IAuthService _authService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  LoginController({
    required IAuthService authService,
  }) : _authService = authService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  Future<void> login() async {
    try {
      loading(true);
      await _authService.login('', '');
      loading(false);
      message(MessageModel.info(
          title: 'Sucesso', message: 'Login realizado com sucesso'));
    } catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      loading(false);
      message(
          MessageModel.error(title: 'Erro', message: 'Erro ao realizar login'));
    }
  }
}
