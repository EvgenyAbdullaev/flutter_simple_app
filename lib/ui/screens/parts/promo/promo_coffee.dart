import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../navigation/app_state_manager.dart';
import '../../../../network/net_models.dart';

import '../text_styles.dart';

class PromoCoffee extends StatefulWidget {
  PromoCoffee({required this.coffee, Key? key}) : super(key: key);

  final APICoffee coffee;

  @override
  _PromoCoffeeState createState() => _PromoCoffeeState();
}

class _PromoCoffeeState extends State<PromoCoffee> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 0,
            blurRadius: 3,
            //offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8, top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Provider.of<AppStateManager>(context, listen: false)
                    .showDetails(true, widget.coffee);
              },
              child: SizedBox(
                height: 120,
                child: Stack(children: [
                  Center(
                    child: CachedNetworkImage(
                      imageUrl: widget.coffee.img,
                      placeholder: (context, url) => placeholderCoffee(),
                      errorWidget: (context, url, error) =>
                            placeholderCoffee(),
                    ),
                  ),
                  Positioned(
                    top: -3,
                    child: discountCard(context, widget.coffee.discount),
                  ),
                  Positioned(
                    top: -13,
                    right: -11,
                    child: favButton(context, widget.coffee),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.coffee.brand,
              textAlign: TextAlign.start,
              style: styleCoffeeLabelBold(),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 33,
              width: 130,
              child: Text(
                widget.coffee.label,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: true,
                textAlign: TextAlign.left,
                style: styleCoffeeLabel(),
              ),
            ),
            Text(
              widget.coffee.weight.toString() + ' g. / ' + widget.coffee
                  .price.toStringAsFixed(0) + '',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: styleCoffeeWeight(),
            ),
            _buildBuyButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBuyButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 6,
        ),
        priceText(widget.coffee.price, widget.coffee.discount),
        SizedBox(
          height: 4,
        ),
        _buttonPlusEmpty(context),
      ],
    );
  }

  Widget _buttonPlusEmpty(BuildContext context) {
    final ButtonStyle noPressedStyle = ElevatedButton.styleFrom(
      visualDensity: VisualDensity.compact,
      textStyle: styleCoffeeButton1(),
      animationDuration: Duration(seconds: 0),
      primary: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );

    return SizedBox(
      width: 140,
      height: 30,
      child: ElevatedButton(
        style: noPressedStyle,
        onPressed: () { },
        child: Text('Buy', style: styleCoffeeButton1()),
      ),
    );
  }

  Widget favButton(BuildContext context, APICoffee c) {
    return IconButton(
      splashRadius: 1.0,
      onPressed: () { },
      icon: Icon(Icons.favorite_border),
      color: Colors.grey,
      iconSize: 25.0,
    );
  }

  Widget discountCard(BuildContext context, double discount) {
    if (discount != 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              width: 60,
              height: 26,
              child: Text(
                '-' + discount.toStringAsFixed(0) + '%',
                style: styleCoffeeDiscount(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],

      );
    } else {
      return Container();
    }
  }

  Widget priceText(double price, double discount) {
    String result = '';
    TextStyle txtStyle;

    result = price.toStringAsFixed(0);

    if (discount == 0) {
      txtStyle = styleCoffeePrice1();
    } else {
      txtStyle = styleCoffeePrice2();
    }

    return Text(result + "", textAlign: TextAlign.right, style: txtStyle);
  }
}
