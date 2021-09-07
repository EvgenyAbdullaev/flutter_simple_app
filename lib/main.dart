import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
    ));

    return MaterialApp(
      title: 'SimpleApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Colors.white,
        accentColor: Colors.amber,
        brightness: Brightness.light,
        primaryIconTheme: IconThemeData(color: Colors.black),
      ),
      home: HomeScreen(),
      //const MainScreen(),
    );
  }
}