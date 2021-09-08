import 'package:flutter/material.dart';
import '../text_styles.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset("assets/img/logo/logo.jpg", height: 50,),
            Expanded(child: SizedBox()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              Text('Time of delivery:', style: styleSmallLogo()),
              Text('10:00 - 19:00', style: styleSmallLogo(),)
            ],),
            SizedBox(
              height: 30,
              width: 30,
              child: IconButton(
                  onPressed: () {
                    _showMyDialog(context);
                  },
                  color: Colors.black26,
                  splashRadius: 1.0,
                  visualDensity: VisualDensity.compact,
                  icon: Icon(Icons.info_outline)),
            )
          ],
        ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Time of delivery'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Bla-bla-bla bla-bla?', style: styleSmallLogo(),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
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