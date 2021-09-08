import 'package:flutter/material.dart';
import '../text_styles.dart';
import '../../../../network/net_models.dart';
import 'promo_coffee.dart';
import 'package:provider/provider.dart';
import '../../../../data/moor/m_repo.dart';

class PromoDiscount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<APICoffee>>(
      future: Provider.of<MoorRepo>(context).getDiscounts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == null) {
            return Text('error: discount list');
          }

          final discounts = snapshot.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('Super Discounts!!', style: stylePromoPopularTitle
                  (),),
              ),
              SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 290,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: discounts.length,
                        itemBuilder: (context, index) {
                          return PromoCoffee(coffee: discounts[index]);
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 16);
                        })
                ),
              )
            ],
          );
        } else {
          return Text('');
        }
      },
    );
  }
}