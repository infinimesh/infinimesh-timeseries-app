import 'package:get/get.dart';

import '../modules/cred/bindings/cred_binding.dart';
import '../modules/cred/views/cred_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/init/bindings/init_binding.dart';
import '../modules/init/views/init_view.dart';
import '../modules/panel/bindings/panel_binding.dart';
import '../modules/panel/views/panel_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INIT;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INIT,
      page: () => const InitView(),
      binding: InitBinding(),
    ),
    GetPage(
      name: _Paths.CRED,
      page: () => const CredView(),
      binding: CredBinding(),
    ),
    GetPage(
      name: _Paths.PANEL,
      page: () => const PanelView(),
      binding: PanelBinding(),
    ),
  ];
}
