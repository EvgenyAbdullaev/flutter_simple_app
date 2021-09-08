import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'parts/promo/logo.dart';
import 'parts/promo/promo_list.dart';
import 'parts/promo/promo_popular.dart';
import 'parts/promo/promo_discount.dart';
import 'parts/text_styles.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({Key? key}) : super(key: key);

  @override
  _PromoScreenState createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            titleSpacing: 0.0,
            toolbarHeight: 112,
            backgroundColor: Colors.white,
            pinned: true,
            brightness: Brightness.light,
            title: Column(
              children: [
                Logo(),
                _buildSearchField(),
              ],
            ),
            elevation: 0.0,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
                <Widget>[
                  _buildBody(),
                ]
            ),
          ),
        ],
      ),
    );

  }

  Widget _buildSearchField() {
    return SizedBox(
      height: 45,
      child: Row(
        children: [
          Expanded(
            child: Card(
              color: Colors.grey[100],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Padding(
                padding: EdgeInsets.only(left: 10, top: 0, bottom: 0),
                child: Row(children: [
                  Icon(Icons.search, size: 25,),
                  SizedBox(width: 4,),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Find something...'),
                      autofocus: false,
                      textInputAction: TextInputAction.done,
                      style: stylePromoSearch(),
                    ),
                  ),
                ],),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        const SizedBox(height: 12,),
        PromoList(),
        const SizedBox(height: 16,),
        PromoDiscount(),
        const SizedBox(height: 16,),
        PromoPopular(),
      ],
    );
  }
}
