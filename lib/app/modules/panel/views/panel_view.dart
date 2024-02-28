import 'package:infinimesh_timeseries_app/app/modules/panel/widgets/zoom_panel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/panel_controller.dart';

class PanelView extends GetView<PanelController> {
  const PanelView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var uid = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
      ),
      body: ZoomPanel(
        uid: uid,
      ),
    );
  }
}
