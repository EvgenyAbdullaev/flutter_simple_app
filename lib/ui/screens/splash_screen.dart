import 'package:flutter/material.dart';
import '../../navigation/pages_const.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: PagesConst.splashScreen,
      key: ValueKey(PagesConst.splashScreen),
      child: const SplashScreen(),);
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Text('Loading...')),
    );
  }
}