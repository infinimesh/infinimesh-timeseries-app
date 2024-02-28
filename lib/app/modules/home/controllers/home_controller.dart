import 'dart:io';
import 'package:infinimesh_timeseries_app/app/constant/storage.dart';
import 'package:infinimesh_timeseries_app/app/routes/app_pages.dart';
import 'package:infinimesh_timeseries_app/app/services/dashboard_repositories.dart';
import 'package:infinimesh_timeseries_app/app/widgets/id_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var watchPanelUid = <String>[].obs;
  // var watchLoginState = false.obs;
  @override
  void onInit() async {
    super.onInit();
    await getPanelUid();
    // watchLoginState.value =
    //     (box.read('login') != null) ? box.read('login') : false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  logout() {
    box.remove('apiKey');
    box.remove('endpoint');
    Get.offAllNamed(Routes.CRED);
  }

  // Future grafanaLogout() async {
  //   try {
  //     await DashboardRepositories().postLogout();
  //   } catch (e) {
  //     print('USER LOGOUT:${e.toString()}');
  //   }
  // }

  Future getPanelUid() async {
    List<String> panelUid = [];
    try {
      var panels = await DashboardRepositories().getPanels();
      if (panels.isNotEmpty) {
        for (var element in panels) {
          panelUid.add(element.uid ?? '');
        }
      }

      watchPanelUid.value = panelUid;
    } catch (e) {
      debugPrint('GET PANELS:$e');
      if (e.toString().contains(
            'ClientException with SocketException: Connection refused',
          )) {
        box.remove('apiKey');
        box.remove('endpoint');
        Get.dialog(
          IDAlertDialog(
            label: 'error',
            title: 'Server Not Found',
            content:
                'Seem your server currently is offline or wrong credentials. Please check the availability of your server with admin.',
            enableButton: true,
            buttonText: 'exit',
            onPressed: () {
              Get.back();
            },
          ),
          barrierDismissible: false,
        ).then((value) => (Platform.isAndroid)
            ? SystemChannels.platform.invokeMethod('SystemNavigator.pop')
            : FlutterExitApp.exitApp(iosForceExit: true));
      } else {
        box.remove('apiKey');
        box.remove('endpoint');
        Get.dialog(
          IDAlertDialog(
            label: 'error',
            title: 'Wrong Credentials',
            content:
                'Your API Key or Server Endpoint Not Found. Please Insert the Correct Credentials.',
            enableButton: true,
            buttonText: 'return',
            onPressed: () {
              Get.offAllNamed(Routes.CRED);
            },
          ),
          barrierDismissible: false,
        );
      }
    }
  }

  // getLoginState(bool value) {
  //   watchLoginState.value = value;
  // }

  // Future displayPanels(String uid) async {
  //   webController = WebViewController()
  //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //     ..setBackgroundColor(const Color(0x00000000))
  // ..setNavigationDelegate(
  //   NavigationDelegate(
  //     onProgress: (int progress) {
  //       // Update loading bar.
  //     },
  //     onPageStarted: (String url) {
  //       log(url);
  //       webController
  //           .runJavaScriptReturningResult(
  //               "document.documentElement.innerText")
  //           .then((value) {
  //         if (value.toString().contains('Logging in...')) {
  //           print("I'M IN STARTED");
  //           box.write('login', true);
  //           watchLoginState.value = true;
  //         }
  //       });
  //     },
  //     onPageFinished: (String url) {
  //       log(url);
  //       webController
  //           .runJavaScriptReturningResult(
  //               "document.documentElement.innerText")
  //           .then((value) {
  //         if (value.toString().contains('Logging in')) {
  //           print("I'M IN FINISHED");
  //         }
  //       });
  //     },
  //   ),
  // )
  // ..loadRequest(
  //   Uri.parse(
  //       'http://localhost:3000/d-solo/$uid/demo?orgId=1&panelId=1" width="450" height="200" frameborder="0"'),
  // );
  // }
}
