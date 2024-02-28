import 'package:infinimesh_timeseries_app/app/constant/appColor.dart';
import 'package:infinimesh_timeseries_app/app/constant/extension.dart';
import 'package:infinimesh_timeseries_app/app/routes/app_pages.dart';
import 'package:infinimesh_timeseries_app/app/widgets/id_webview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          toolbarHeight: 8.0.hp,
          title: Text(
            'My Dasboard',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  controller.logout();
                },
                iconSize: 5.0.wp,
                icon: const Icon(
                  Icons.logout,
                  color: AppColor.LIGHT_COLOR,
                ))
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            controller.watchPanelUid.value = [];
            await controller.getPanelUid();
          },
          child: Center(
            child: (controller.watchPanelUid.isNotEmpty)
                // ? (controller.watchLoginState.isFalse)
                //     ? grafanaLoginPage()
                //     :
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.0.wp),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: (context.isTablet)
                            ? 2
                            : 1, // number of items in each row
                        mainAxisSpacing: 8.0, // spacing between rows
                        crossAxisSpacing: 8.0, // spacing between columns
                      ),
                      padding:
                          const EdgeInsets.all(3.0), // padding around the grid
                      itemCount: controller.watchPanelUid.length,
                      itemBuilder: (context, index) {
                        // controller
                        //     .displayPanels(controller.watchPanelUid[index]);
                        return Stack(
                          children: [
                            Hero(
                              tag: 'panel-${controller.watchPanelUid[index]}',
                              child: Card(
                                color: Colors.black,
                                elevation: 5,
                                child: Padding(
                                  padding: EdgeInsets.all(3.0.wp),
                                  child: IDWebview(
                                    uid: controller.watchPanelUid[index],
                                    // homeController: controller,
                                  ),
                                  // WebViewWidget(
                                  //   controller: controller.webController,
                                  // ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  Routes.PANEL,
                                  arguments: controller.watchPanelUid[index],
                                );
                              },
                            )
                          ],
                        );
                      },
                    ),
                  )
                : const Text('No Dashboard Found'),
            // child:
          ),
        ),
      ),
    );
  }

  // Widget grafanaLoginPage() {
  //   // controller.displayPanels(controller.watchPanelUid.first);
  //   return IDWebview(
  //     uid: controller.watchPanelUid.first,
  //     isHome: true,
  //     homeController: controller,
  //   );
  //   // WebViewWidget(controller: controller.webController);
  // }
}
