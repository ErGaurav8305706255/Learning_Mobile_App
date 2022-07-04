import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewGoogle extends StatefulWidget {
  const WebViewGoogle({Key? key}) : super(key: key);

  @override
  State<WebViewGoogle> createState() => _WebViewGoogleState();
}

class _WebViewGoogleState extends State<WebViewGoogle> {
  @override
  Widget build(BuildContext context) {
    return  const WebView(
      initialUrl: 'https://www.google.co.in/',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
