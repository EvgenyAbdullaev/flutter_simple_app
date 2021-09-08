import 'dart:async';
import 'package:flutter/material.dart';
import '../network/net_models.dart';

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool get isInitialized => _initialized;

  int _selectedTab = 0;
  int get getCurrentTab => _selectedTab;

  bool _isWebView = false;
  String _webTitle = '';
  String _webURL = '';
  bool get isWebView => _isWebView;
  String get webTitle => _webTitle;
  String get webURL => _webURL;

  bool _isShowDetails = false;
  APICoffee? _currentItem;
  bool get isShowDetails => _isShowDetails;
  APICoffee? get currentItem => _currentItem;

  void initializeApp() {
    Timer(const Duration(milliseconds: 1000), () {
      _initialized = true;
      notifyListeners();
    });
  }

  void goToTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }

  void goToWebView(bool pIsWebView, String pTitle, String pURL) {
    _isWebView = pIsWebView;
    _webTitle = pTitle;
    _webURL = pURL;
    notifyListeners();
  }

  void showDetails(bool isShow, APICoffee? c) {
    _isShowDetails = isShow;
    if (c != null) {
      _currentItem = c;
    }
    notifyListeners();
  }


}