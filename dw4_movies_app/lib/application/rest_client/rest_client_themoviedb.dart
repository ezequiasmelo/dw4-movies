import 'package:get/get_connect/connect.dart';

import '../config/env/env.dart';

class RestClientTheMovieDB extends GetConnect {
  RestClientTheMovieDB() {
    httpClient.baseUrl = Env.i['api_url_themoviedb'] ?? '';
  }
}
