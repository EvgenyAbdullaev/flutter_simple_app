import 'dart:async';
import 'package:flutter/material.dart';

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool get isInitialized => _initialized;

  int _selectedTab = 0;
  int get getCurrentTab => _selectedTab;

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

}