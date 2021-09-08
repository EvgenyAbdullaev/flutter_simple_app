import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../network/net_models.dart';
import '../../navigation/app_screens.dart';

import 'parts/text_styles.dart';

class DetailsScreen extends StatefulWidget {
  static MaterialPage page(APICoffee c) {
    return MaterialPage(
        name: PagesConst.detailsScreen,
        key: ValueKey(PagesConst.detailsScreen),
        child: DetailsScreen(
          coffee: c,
        ));
  }

  DetailsScreen({required this.coffee, Key? key}) : super(key: key);

  final APICoffee coffee;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 44,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          backwardsCompatibility: false,
          shadowColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: () { },
              icon: Icon(Icons.favorite_border),
              color: Colors.grey,
              iconSize: 30.0,
              splashRadius: 1.0,
              padding: EdgeInsets.only(right: 10),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate(<Widget>[
                      SizedBox(
                        height: 260,
                        child: CachedNetworkImage(
                          imageUrl: widget.coffee.img,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildPrice(),
                          Text(
                            widget.coffee.weight.toString() + ' g.',
                            style: styleDetailsWeight(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.coffee.label + ' (' + widget.coffee.brand + ')',
                        style: styleDetailsLabel(),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Column(
                        children: _buildParams(),
                      )
                    ]
                      //_buildSearchResult()
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 95,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buttonPlusEmpty(context),
                    ],
                  ),
                ),
              ),
            ),

          ],
        )
    );
  }

  Widget _buttonPlusEmpty(BuildContext context) {
    final ButtonStyle noPressedStyle =
    ElevatedButton.styleFrom(
      textStyle: styleCoffeeButton1(),
      animationDuration: Duration(seconds: 0),
      primary: Colors.green,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: 40.0,
        child: ElevatedButton(
            style: noPressedStyle,
            onPressed: () { },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(widget.coffee.price.toStringAsFixed(0) + '',
                  style: styleCoffeeButton1()),
                Text(' | ', style: styleCoffeeButton1()),
                Text('Buy', style: styleCoffeeButton1()),
              ],
            )
        ),
      ),
    );
  }

  Widget priceText(double price) {
    return Text(price.toStringAsFixed(0) + "", style: styleDetailsLabel());
  }

  Widget _buildPrice() {
    if (widget.coffee.discount == 0) {
      return Text(
        widget.coffee.price.toStringAsFixed(0) + '',
        style: styleDetailsPrice(),
      );
    } else {
      return Text(
        widget.coffee.price.toStringAsFixed(0) + ' [-'
            + widget.coffee.discount.toStringAsFixed(0) + '%]',
        style: styleDetailsPriceDiscount(),
      );
    }
  }

  List<Widget> _buildParams() {
    List<Widget> result = [];

    const div = const Divider(
      color: Colors.grey,
      height: 35,
    );

    if (widget.coffee.tt != '') {
      result.add(_buildParamRow('Вид зерён', widget.coffee.tt));
      result.add(div);
    }

    if (widget.coffee.compound != '') {
      result.add(_buildParamRow('Состав', widget.coffee.compound));
      result.add(div);
    }

    if (widget.coffee.roast != '') {
      result.add(_buildParamRow('Обжарка', widget.coffee.roast));
      result.add(div);
    }

    if (widget.coffee.pack != '') {
      result.add(_buildParamRow('Упаковка', widget.coffee.pack));
      result.add(div);
    }

    if (widget.coffee.intensity != '') {
      result.add(_buildParamRow('Интенсивность', widget.coffee.intensity));
      result.add(div);
    }

    if (widget.coffee.drink != '') {
      result.add(_buildParamRow('Напитки', widget.coffee.drink));
      result.add(div);
    }

    if (widget.coffee.life != '') {
      result.add(_buildParamRow('Срок годности', widget.coffee.life + ' мес'));
      result.add(div);
    }

    if (widget.coffee.origin != '') {
      result.add(_buildParamRow('Страна', widget.coffee.origin));
      result.add(div);
    }

    if (widget.coffee.description != '') {
      final elem = Text(
          widget.coffee.description,
          softWrap: true,
          style: styleDetailsValue(),
      );
      result.add(Text('Описание: ', style: styleDetailsParam(),));
      result.add(SizedBox(height: 16,));
      result.add(elem);
    }
    
    result.add(SizedBox(height: 100,));

    return result;
  }

  Widget _buildParamRow(String param, String val) {
    final wScreen = MediaQuery.of(context).size.width;
    final double wColumn1 = 150;
    final double wColumn2 = wScreen - 200;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: wColumn1,
          child: Text(
            param,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: styleDetailsParam(),
          ),
        ),
        SizedBox(
          width: wColumn2,
          child: Text(
            val,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: styleDetailsValue(),
          ),
        ),
      ],
    );
  }
}
