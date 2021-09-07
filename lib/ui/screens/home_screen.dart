import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../navigation/pages_const.dart';
import '../../navigation/app_state_manager.dart';

import 'test_screen.dart';

class HomeScreen extends StatefulWidget {
  static MaterialPage page(int currentTab) {
    return MaterialPage(
      name: PagesConst.homeScreen,
      key: ValueKey(PagesConst.homeScreen),
      child: HomeScreen(
        currentTab: currentTab,
      ),
    );
  }

  HomeScreen({required this.currentTab, Key? key}) : super(key: key);

  final int currentTab;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pageList = <Widget>[];

  @override
  void initState() {
    super.initState();

    pageList.add(TestScreen(title: 'Home'));
    pageList.add(TestScreen(title: 'Catalog'));
    pageList.add(TestScreen(title: 'Cart'));
    pageList.add(TestScreen(title: 'Favorites'));
    pageList.add(TestScreen(title: 'Settings'));
  }

  @override
  Widget build(BuildContext context) {
    const double iconSize = 24;
    const double tabButtonWidth = 65;

    return Consumer<AppStateManager>(
      builder: (context, appStateManager, child) {
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            elevation: 10.0,
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: tabButtonWidth,
                    child: GestureDetector(
                      onTap: () {
                        Provider.of<AppStateManager>(context, listen: false)
                            .goToTab(0);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: SvgPicture.asset(
                                'assets/svg/icon_home.svg',
                                color: appStateManager.getCurrentTab == 0
                                    ? Theme.of(context).accentColor
                                    : Colors.grey,
                                semanticsLabel: 'Home',
                                width: iconSize,
                                height: iconSize,
                              )),
                          Text('Home'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: tabButtonWidth,
                    child: GestureDetector(
                      onTap: () {
                        Provider.of<AppStateManager>(context, listen: false)
                            .goToTab(1);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: SvgPicture.asset(
                              'assets/svg/icon_list.svg',
                              color: appStateManager.getCurrentTab == 1
                                  ? Theme.of(context).accentColor
                                  : Colors.grey,
                              semanticsLabel: 'Catalog',
                              width: iconSize,
                              height: iconSize,
                            ),
                          ),
                          Text('Catalog'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: tabButtonWidth,
                    child: GestureDetector(
                      onTap: () {
                        Provider.of<AppStateManager>(context, listen: false)
                            .goToTab(2);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SvgPicture.asset(
                              'assets/svg/icon_cart.svg',
                              color: appStateManager.getCurrentTab == 2
                                  ? Theme.of(context).accentColor
                                  : Colors.grey,
                              semanticsLabel: 'Cart',
                              width: iconSize,
                              height: iconSize,
                            ),
                          ),
                          Text('Cart')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: tabButtonWidth,
                    child: GestureDetector(
                      onTap: () {
                        Provider.of<AppStateManager>(context, listen: false)
                            .goToTab(3);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(child: SvgPicture.asset(
                            'assets/svg/icon_favorite.svg',
                            color: appStateManager.getCurrentTab == 3
                                ? Theme.of(context).accentColor
                                : Colors.grey,
                            semanticsLabel: 'Favorites',
                            width: iconSize,
                            height: iconSize,
                          )),
                          Text('Favorites'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: tabButtonWidth,
                    child: GestureDetector(
                      onTap: () {
                        Provider.of<AppStateManager>(context, listen: false)
                            .goToTab(4);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SvgPicture.asset(
                              'assets/svg/icon_profile.svg',
                              color: appStateManager.getCurrentTab == 4
                                  ? Theme.of(context).accentColor
                                  : Colors.grey,
                              semanticsLabel: 'Settings',
                              width: iconSize,
                              height: iconSize,
                            ),
                          ),
                          Text('Settings')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: IndexedStack(
            index: appStateManager.getCurrentTab,
            children: pageList,
          ),
        );
      },
    );
  }
}