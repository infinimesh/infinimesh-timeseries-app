import 'package:infinimesh_timeseries_app/app/constant/appColor.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shimmer/shimmer.dart';

class IDWebview extends StatefulWidget {
  const IDWebview({
    super.key,
    required this.uid,
    this.isHome = false,
    // this.homeController,
  });
  final String uid;
  final bool isHome;
  // final HomeController? homeController;

  @override
  State<IDWebview> createState() => _IDWebviewState();
}

class _IDWebviewState extends State<IDWebview> {
  late WebViewController webController;
  bool isShimmer = false;

  @override
  void initState() {
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (mounted) {
              setState(() {
                isShimmer = true;
              });
            }
          },
          onPageStarted: (String url) {
            if (mounted) {
              setState(() {
                isShimmer = false;
              });
            }

            // (widget.isHome == true)
            //     ? webController
            //         .runJavaScriptReturningResult(
            //             "document.documentElement.innerText")
            //         .then((value) {
            //         if (value.toString().contains('Logging in...')) {
            //           print("I'M IN STARTED");
            //           box.write('login', true);
            //           widget.homeController!.getLoginState(true);
            //           // watchLoginState.value = true;
            //         }
            //       })
            //     : null;
          },
          onPageFinished: (String url) {
            if (mounted) {
              setState(() {
                isShimmer = false;
              });
            }

            // (widget.isHome == true)
            //     ? webController
            //         .runJavaScriptReturningResult(
            //             "document.documentElement.innerText")
            //         .then((value) {
            //         if (value.toString().contains('Logging in')) {
            //           print("I'M IN FINISHED");
            //         }
            //       })
            //     : null;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
            'http://localhost:3000/d-solo/${widget.uid}/demo?orgId=1&panelId=1" width="450" height="200" frameborder="0"'),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (isShimmer == true)
        ? Shimmer.fromColors(
            baseColor: AppColor.SHIMMER_COLOR,
            highlightColor: Colors.white,
            child: Container(
              color: AppColor.DEFAULT_COLOR,
            ))
        : WebViewWidget(controller: webController);
  }
}
