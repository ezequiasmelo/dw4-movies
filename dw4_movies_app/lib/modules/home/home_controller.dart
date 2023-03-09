import 'package:dw4_movies_app/application/constants/app_routes.dart';
import 'package:dw4_movies_app/application/services/auth_service.dart';
import 'package:dw4_movies_app/modules/profile/Profile_bindings.dart';
import 'package:dw4_movies_app/modules/profile/Profile_page.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';

import '../favorites/favorites_bindings.dart';
import '../favorites/favorites_page.dart';
import '../movies/movies_bindigs.dart';
import '../movies/movies_page.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;

  final _tabs = [
    AppRoutes.movies,
    AppRoutes.favorites,
    AppRoutes.profile,
    AppRoutes.exit
  ];

  final _tabIndex = 0.obs;

  int get tabIndex => _tabIndex.value;

  void goToTab(int index) {
    _tabIndex(index);
    if (_tabs[index] == AppRoutes.exit) {
      Get.find<AuthService>().logout();
    }
    Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == AppRoutes.movies) {
      return GetPageRoute(
        settings: settings,
        page: () => const MoviesPage(),
        binding: MoviesBindigs(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == AppRoutes.favorites) {
      return GetPageRoute(
        settings: settings,
        page: () => const FavoritesPage(),
        binding: FavoritesBindings(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == AppRoutes.profile) {
      return GetPageRoute(
        settings: settings,
        page: () => ProfilePage(),
        binding: ProfileBindings(),
        transition: Transition.fadeIn,
      );
    }

    return null;
  }
}
