import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PostAnAdd extends StatefulWidget {
  const PostAnAdd({super.key});

  @override
  State<PostAnAdd> createState() => _PostAnAddState();
}

class _PostAnAddState extends State<PostAnAdd> {
  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://carservicesltd.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://carservicesltd.com/index.php/add-listing/places/'));
    return Scaffold(
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
