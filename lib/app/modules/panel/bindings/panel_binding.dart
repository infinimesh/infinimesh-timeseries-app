import 'package:get/get.dart';

import '../controllers/panel_controller.dart';

class PanelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PanelController>(
      () => PanelController(),
    );
  }
}
