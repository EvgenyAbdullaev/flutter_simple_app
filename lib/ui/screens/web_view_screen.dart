import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import '../../navigation/app_screens.dart';

class WebViewScreen extends StatefulWidget {
  static MaterialPage page(String title, String url) {
    return MaterialPage(
      name: PagesConst.webViewScreen,
      key: ValueKey(PagesConst.webViewScreen),
      child: WebViewScreen(mTitle: title, mUrl: url),);
  }

  WebViewScreen({
    required this.mTitle,
    required this.mUrl,
    Key? key}) : super(key: key);

  final String mTitle;
  final String mUrl;

  @override
  WebViewScreenState createState() => WebViewScreenState();
}

class WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mTitle),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        titleTextStyle: TextStyle(color: Colors.black),
      ),
      body: WebView(
        initialUrl: widget.mUrl + 'index.html',
      ),
    );
  }
}
