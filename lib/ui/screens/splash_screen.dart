import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../navigation/pages_const.dart';
import '../../navigation/app_state_manager.dart';

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
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 1)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          _loadedData();
          return _buildBody('Loading Complete');
        } else {
          return _buildBody('Loading...');
        }
      },
    );

  }

  Widget _buildBody(String str) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Text(str)),
    );
  }

  void _loadedData() async {
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }
}