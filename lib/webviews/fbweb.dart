import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



class Fbweb extends StatelessWidget {
  final Completer<WebViewController> _controller=
    Completer<WebViewController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: "https://www.facebook.com/technothlon.techniche",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController
        webViewController){
          _controller.complete(webViewController);
        },
      )

    );
  }
}
























