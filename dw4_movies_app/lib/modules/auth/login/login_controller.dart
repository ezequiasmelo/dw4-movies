import 'dart:developer';

import 'package:get/get.dart';

import 'package:dw4_movies_app/application/mixins/loader_mixin.dart';
import 'package:dw4_movies_app/application/mixins/messages_mixin.dart';
import 'package:get_storage/get_storage.dart';

import '../../../application/constants/app_constants.dart';
import '../../../application/exceptions/user_not_found_exception.dart';
import '../../../repositories/auth/auth_repository.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;

  final _isLoading = false.obs;
  final _message = Rxn<MessageModel>();

  final formValid = false.obs;

  LoginController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_isLoading);
    messageListener(_message);
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      _isLoading.toggle();
      final userLogged = await _authRepository.login(email, password);

      final storage = GetStorage();
      storage.write(AppConstants.USER_KEY, userLogged.id);

      _isLoading.toggle();
    } on UserNotFoundException catch (e, s) {
      _isLoading.toggle();

      log('Erro ao fazer login',
          error: 'Usuário e/ou senha incorretos', stackTrace: s);
      _message(MessageModel(
        title: 'Erro',
        message: 'Usuário e/ou senha incorretos',
        type: MessageType.error,
      ));
    } catch (e, s) {
      _isLoading.toggle();

      log('Erro', error: 'Erro ao fazer login', stackTrace: s);
      _message(MessageModel(
        title: 'Erro',
        message: 'Erro ao fazer login',
        type: MessageType.error,
      ));
    }
  }
}
