import 'package:flutter/material.dart';
import '../text_styles.dart';
import 'package:provider/provider.dart';
import '../../../../navigation/app_state_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PromoUrl extends StatelessWidget {
  PromoUrl(
      {required this.text1, required this.text2, required this.pUrl, Key? key})
      : super(key: key);

  final String text1;
  final String text2;
  final String pUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          Provider.of<AppStateManager>(context, listen: false)
              .goToWebView(true, text1, pUrl);
        },
        child: Container(
          constraints: const BoxConstraints.expand(height: 100),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            image: DecorationImage(
              image: CachedNetworkImageProvider(pUrl + 'img.jpg'),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 0,
                blurRadius: 3,
                //offset: Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  child: Text(
                    text1,
                    style: stylePromoUrlMain(),
                    maxLines: 1,
                  ),
                ),
              ),
              Positioned(
                top: 30,
                child: Text(
                  text2,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                  style: stylePromoUrlSmall(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
