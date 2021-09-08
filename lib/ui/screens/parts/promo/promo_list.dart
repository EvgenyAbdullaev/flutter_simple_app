import 'package:flutter/material.dart';
import 'promo_url.dart';
import '../../../../network/model_response.dart';

class PromoList extends StatelessWidget {

  PromoList({Key? key });

  final controller = PageController();

  final List<String> _text1 = [
    'Title 1 - big title',
    'Title 2 - big title',
    'Title 3 - big title'
  ];

  final List<String> _text2 = [
    'Small1 - adds, bla, bla...',
    'Small2 - adds, bla, bla...',
    'Small3 - adds, bla, bla...',
  ];

  final List<String> _urls = [
    apiUrl + 'html/turka/',
    apiUrl + 'html/arabica_vs_robusta/',
    apiUrl + 'html/plus/'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: PageView(
        controller: controller,
        children: List.generate(3, (index) => PromoUrl(text1: _text1[index],
            text2: _text2[index], pUrl: _urls[index])),
      ),
    );
  }

}