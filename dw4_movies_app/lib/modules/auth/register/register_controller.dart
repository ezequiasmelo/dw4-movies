import 'dart:developer';

import 'package:dw4_movies_app/application/mixins/loader_mixin.dart';
import 'package:dw4_movies_app/application/mixins/messages_mixin.dart';
import 'package:dw4_movies_app/repositories/auth/auth_repository.dart';
import 'package:get/get.dart';

import '../../../application/exceptions/rest_client_exception.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;

  final _isLoading = false.obs;
  final _message = Rxn<MessageModel>();
  final formValid = false.obs;

  RegisterController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    loaderListener(_isLoading);
    messageListener(_message);
    super.onInit();
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _isLoading.toggle();
      final user = await _authRepository.register(name, email, password);
      _isLoading.toggle();

      // final storage = GetStorage();
      // storage.write(AppConstants.USER_KEY, user.id);

      Get.back();
    } on RestClientException catch (e, s) {
      _isLoading.toggle();

      log('Erro ao cadastrar usuário', error: e.message, stackTrace: s);

      _message(MessageModel(
          title: 'Erro', message: e.message, type: MessageType.error));
    } catch (e, s) {
      _isLoading.toggle();

      log('Erro', error: 'Erro ao cadastrar usuário', stackTrace: s);

      _message(MessageModel(
          title: 'Erro',
          message: 'Erro ao cadastrar usuário',
          type: MessageType.error));
    }
  }
}
