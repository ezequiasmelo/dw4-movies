import 'dart:developer';

import 'package:dw4_movies_app/application/mixins/loader_mixin.dart';
import 'package:dw4_movies_app/application/mixins/messages_mixin.dart';
import 'package:dw4_movies_app/services/auth/iauth_service.dart';
import 'package:get/get.dart';

import '../../../application/config/jwt/jwt_decode_payload.dart';
import '../../../application/exceptions/rest_client_exception.dart';

class SignUpController extends GetxController with LoaderMixin, MessagesMixin {
  final IAuthService _iAuthService;

  final _isLoading = false.obs;
  final _message = Rxn<MessageModel>();

  final formValid = false.obs;

  SignUpController({
    required IAuthService iauthService,
  }) : _iAuthService = iauthService;

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
      final userLogged = await _iAuthService.register(name, email, password);
      _isLoading.toggle();

//TODO:

      Map<String, dynamic> decodedTokenPayload =
          JwtDecodePayload.i.decode(userLogged.accessToken);

      // final storage = GetStorage();
      // storage.write(AppConstants.USER_KEY, userLogged.id);
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
