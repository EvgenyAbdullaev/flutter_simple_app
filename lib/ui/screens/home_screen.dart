import 'package:flutter/material.dart';
import '../../navigation/pages_const.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Text('Home Screen')),
    );
  }
}