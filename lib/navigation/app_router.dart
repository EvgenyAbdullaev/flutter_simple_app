import 'package:flutter/material.dart';
import 'app_state_manager.dart';
import 'app_screens.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;

  AppRouter({
    required this.appStateManager
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (!appStateManager.isInitialized)
          SplashScreen.page(),

        if (appStateManager.isInitialized)
          HomeScreen.page(appStateManager.getCurrentTab),

        if (appStateManager.isWebView)
          WebViewScreen.page(appStateManager.webTitle, appStateManager.webURL),

        if (appStateManager.isShowDetails && appStateManager.currentItem != null)
          DetailsScreen.page(appStateManager.currentItem!),

      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    if (route.settings.name == PagesConst.webViewScreen) {
      appStateManager.goToWebView(false, '', '');
    }

    if (route.settings.name == PagesConst.detailsScreen) {
      appStateManager.showDetails(false, null);
    }

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    super.dispose();
  }
}