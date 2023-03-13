import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../application/config/jwt/jwt_decode_payload.dart';
import '../../../application/constants/app_constants.dart';
import '../../../application/exceptions/user_not_found_exception.dart';
import '../../../application/mixins/loader_mixin.dart';
import '../../../application/mixins/messages_mixin.dart';
import '../../../services/auth/iauth_service.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final IAuthService _iAuthService;

  final _isLoading = false.obs;
  final _message = Rxn<MessageModel>();

  final formValid = false.obs;

  LoginController({
    required IAuthService iAuthService,
  }) : _iAuthService = iAuthService;

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
      final userLogged = await _iAuthService.login(email, password);

      Map<String, dynamic> decodedTokenPayload =
          JwtDecodePayload.i.decode(userLogged.accessToken);

      final storage = GetStorage();
      storage.write(AppConstants.USER_KEY, decodedTokenPayload['id']);
      storage.write(AppConstants.ACCESS_TOKEN, userLogged.accessToken);
      storage.write(AppConstants.REFRESH_TOKEN, userLogged.refreshToken);

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
