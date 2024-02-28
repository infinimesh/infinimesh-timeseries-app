import 'package:get/get.dart';

import '../controllers/init_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<InitController>(
      InitController(),
    );
  }
}
