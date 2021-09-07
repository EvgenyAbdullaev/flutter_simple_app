import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  TestScreen({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: Text(title)),
    );
  }

}