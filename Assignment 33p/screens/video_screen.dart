import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video")),
      body: WebViewWidget(
        controller: WebViewController()
          ..loadRequest(Uri.parse(
              "https://www.youtube.com/watch?v=dQw4w9WgXcQ")),
      ),
    );
  }
}