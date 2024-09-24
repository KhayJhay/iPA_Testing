import 'package:flutter/material.dart';
import 'package:orc_public/utils/widgets/custom_appBar.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:shimmer/shimmer.dart';

class Registratio_Webview extends StatefulWidget {
  String webUrl;
  Registratio_Webview({super.key, this.webUrl = ''});

  @override
  State<Registratio_Webview> createState() => _Registratio_WebviewState();
}

class _Registratio_WebviewState extends State<Registratio_Webview> {
  late final WebViewController _controller;
  late final PlatformWebViewControllerCreationParams params;
  int isLoading = 0;
  @override
  void initState() {
    super.initState();

    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              isLoading = progress;
            });
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            } else if (request.url.startsWith('https://www.facebook.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'Message',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(widget.webUrl));
    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Custom_AppBar(
            title: 'Registration Services',
            hasBackbtn: true,
            backBtn: () {
              Navigator.pop(context);
            },
          )),
      body: Stack(
          children: [WebViewWidget(controller: _controller), loadingWidget()]),
    );
  }

  loadingWidget() {
    return Visibility(
      visible: isLoading < 100,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[200]!,
        highlightColor: Colors.grey[100]!,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 8.5,
                shadowColor: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
