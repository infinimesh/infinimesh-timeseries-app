import 'package:infinimesh_timeseries_app/app/constant/storage.dart';
import 'package:infinimesh_timeseries_app/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CredController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController serverController = TextEditingController(text: '');
  TextEditingController keyController = TextEditingController(text: '');
  var watchServerEndpoint = ''.obs;
  var watchApiKey = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getServerEndpoint(String endpoint) {
    watchServerEndpoint.value = endpoint;
  }

  getApiKey(String key) {
    watchApiKey.value = key;
  }

  String? validateServerEndpoint(String value) {
    if (!value.contains(':') ||
        !value.contains('http') ||
        !value.contains('https')) {
      return 'Wrong Format';
    } else if (value.isEmpty) {
      return 'Required';
    }
    return null;
  }

  String? validateApiKey(String value) {
    if (value.isEmpty) {
      return 'Required';
    }
    return null;
  }

  submitCaptureInput() {
    // final isValid = formKey.currentState!.validate();
    // if (isValid) {
    if (watchApiKey.isNotEmpty && watchServerEndpoint.isNotEmpty) {
      box.write('endpoint', watchServerEndpoint.value);
      box.write('apiKey', watchApiKey.value);
      Get.offAllNamed(Routes.HOME);
    }
    // } else {
    //   return null;
    // }
  }
}
