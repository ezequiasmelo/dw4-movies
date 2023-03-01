import 'package:get/get_connect/connect.dart';

import '../config/env/env.dart';

class RestClient extends GetConnect {
  RestClient() {
    httpClient.baseUrl = Env.i['api_url_themoviedb'] ?? '';
  }
}
