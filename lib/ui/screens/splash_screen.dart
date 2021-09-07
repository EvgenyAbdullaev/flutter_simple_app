import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';

import '../../navigation/pages_const.dart';
import '../../navigation/app_state_manager.dart';

import '../../network/net_service.dart';
import '../../network/net_models.dart';
import '../../network/model_response.dart';

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
    return FutureBuilder<Response<Result<APIAllQuery>>>(
      future: Provider.of<NetService>(context, listen: false).queryAllCoffee(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {

          if (snapshot.hasError) {
            return _buildBody('Err: server error');
          }

          if (snapshot.data == null) {
            return _buildBody('Err: data error(0)');
          }

          if (snapshot.data!.body == null) {
            return _buildBody('Err: data error(1)');
          }

          final result = snapshot.data!.body;
          if (result is Error) {
            return _buildBody('Err: data error(2)');
          }

          APIAllQuery query = (result as Success).value;
          _loadedData(context, query);

          return _buildBody('Ok: data loaded');
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

  void _loadedData(BuildContext context, APIAllQuery query) async {
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }
}