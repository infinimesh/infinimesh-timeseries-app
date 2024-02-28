import 'package:infinimesh_timeseries_app/app/constant/storage.dart';
import 'package:infinimesh_timeseries_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class InitController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    box.read('apiKey') != null
        ? Get.offAllNamed(Routes.HOME)
        : Get.offAllNamed(Routes.CRED);
  }
}
