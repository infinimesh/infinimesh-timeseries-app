import 'package:get/get.dart';

import '../controllers/cred_controller.dart';

class CredBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CredController>(
      () => CredController(),
    );
  }
}
