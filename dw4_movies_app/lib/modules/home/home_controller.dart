import 'package:dw4_movies_app/services/auth/auth_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;
  static const INDEX_PAGE_EXIT = 2;
  final IAuthService _authService;

  HomeController({
    required IAuthService authService,
  }) : _authService = authService;

  final pages = ['/movies', '/favorites'];

  final _pageIndex = 0.obs;

  int get pageIndex => _pageIndex.value;

  void goToPage(int page) {
    _pageIndex(page);
    if (page == INDEX_PAGE_EXIT) {
      _authService.logout();
    } else {
      Get.offNamed(pages[page], id: NAVIGATOR_KEY);
    }
  }
}
