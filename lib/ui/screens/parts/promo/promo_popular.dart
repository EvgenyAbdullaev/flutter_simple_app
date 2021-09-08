import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../network/net_models.dart';
import '../../../../data/moor/m_repo.dart';
import '../text_styles.dart';
import 'promo_coffee.dart';

class PromoPopular extends StatelessWidget {
  PromoPopular({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<APICoffee>>(
      future: Provider.of<MoorRepo>(context).getPopular(),
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
                child: Text('Popular', style: stylePromoPopularTitle(),),
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