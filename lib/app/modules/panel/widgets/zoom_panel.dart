import 'package:infinimesh_timeseries_app/app/constant/extension.dart';
import 'package:infinimesh_timeseries_app/app/widgets/id_webview.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ZoomPanel extends StatefulWidget {
  final String uid;
  const ZoomPanel({
    super.key,
    required this.uid,
  });

  @override
  State<ZoomPanel> createState() => _ZoomPanelState();
}

class _ZoomPanelState extends State<ZoomPanel>
    with SingleTickerProviderStateMixin {
  late TransformationController controller;
  late AnimationController animationController;
  late WebViewController webController;
  Animation<Matrix4>? animation;

  final double minScale = 1;
  final double maxScale = 4;

  @override
  void initState() {
    super.initState();

    controller = TransformationController();
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 200,
        ))
      ..addListener(
        () => controller.value = animation!.value,
      );
  }

  @override
  void dispose() {
    controller.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'panel-${widget.uid}',
      child: Center(
        child: Container(
          height: 80.0.hp,
          width: 95.0.wp,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(3.0.wp),
          ),
          child: InteractiveViewer(
            transformationController: controller,
            clipBehavior: Clip.none,
            minScale: minScale,
            maxScale: maxScale,
            onInteractionEnd: (details) {
              resetAnimation();
            },
            child: Padding(
              padding: EdgeInsets.all(3.0.wp),
              child: IDWebview(uid: widget.uid),
              // WebViewWidget(controller: webController),
            ),
          ),
        ),
      ),
    );
  }

  void resetAnimation() {
    animation = Matrix4Tween(
      begin: controller.value,
      end: Matrix4.identity(),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceInOut,
    ));
    animationController.forward(from: 0);
  }
}
