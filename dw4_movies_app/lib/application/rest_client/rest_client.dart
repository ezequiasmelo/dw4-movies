import 'dart:developer';

import 'package:get/get_connect/connect.dart';
import 'package:get_storage/get_storage.dart';

import '../config/env/env.dart';
import '../constants/app_constants.dart';

class RestClient extends GetConnect {
  RestClient() {
    httpClient.baseUrl = Env.i['backend_base_url'] ?? '';

    httpClient.addRequestModifier<Object?>((request) {
      log('url: ${request.url.toString()}');
      final storage = GetStorage();
      final accessToken = storage.read(AppConstants.ACCESS_TOKEN);
      request.headers['Authorization'] = 'Bearer ${accessToken}';
      return request;
    });
  }
}
