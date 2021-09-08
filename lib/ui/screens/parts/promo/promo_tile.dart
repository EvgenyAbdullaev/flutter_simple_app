import 'package:flutter/material.dart';
import '../text_styles.dart';

class PromoTile extends StatelessWidget {

  const PromoTile(Key key, this.urlImage, this.textMain, this.textSecond);

  final String urlImage;
  final String textMain;
  final String textSecond;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/images/logo/logo.jpg", height: 50,),
        Expanded(child: SizedBox()),
        Column(
          //mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Время доставки:', style: styleSmallLogo()),
            Text('10:00 - 19:00', style: styleSmallLogo(),)
          ],),
        IconButton(
            onPressed: () {
              _showMyDialog(context);
            },
            color: Colors.black26,
            visualDensity: VisualDensity.compact,
            icon: Icon(Icons.info_outline))
      ],
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Время доставки'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Обычно товары доставляются с 10:00 до 19:00.\n\nВремя '
                    'доставки '
                    'может '
                    'разным в '
                    'зависимости от '
                    'загружености дорог и доступности курьеров.\n\nПриносим '
                    'свои извинения, в случае задержки.', style: styleSmallLogo(),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ясно'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}