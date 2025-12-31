import 'package:get/get.dart';
import '../routes/routes.dart';

class NavController extends GetxController {
  RxInt currentIndex = 0.obs;

  final routes = [
    AppRoutes.home,
    AppRoutes.report,
    AppRoutes.community,
    AppRoutes.chat,
    AppRoutes.profile,
  ];

  /// Call this whenever route changes
  void updateIndexByRoute(String? route) {
    final index = routes.indexOf(route ?? '');
    if (index != -1) {
      currentIndex.value = index;
    }
  }

  void changeTab(int index) {
    currentIndex.value = index;
    Get.offAllNamed(routes[index]);
  }
}
