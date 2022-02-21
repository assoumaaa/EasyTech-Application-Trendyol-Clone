import 'package:flutter/material.dart';
import 'package:week6_starter/model/discounted_phones.dart';
import 'package:week6_starter/utils/styles.dart';

List<String> phoneImages = [
  "https://assets.swappie.com/SwappieXsGold-1-1-1.png",
];

class discountTile extends StatelessWidget {
  final discount discountt;
  const discountTile({required this.discountt});

  @override
  Widget build(BuildContext context) {
    return Card(

        margin: EdgeInsets.symmetric(horizontal:1),
        child: Padding(
            padding: EdgeInsets.all(1),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      discountt.phoneName,
                      style: discountedPhoneStyles,
                    ),
                  ],
                ),
                Image(
                  image: NetworkImage(discountt.image),
                  width: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 0),
                  child: Row(
                    children: [
                      Text("${discountt.oldPrice} TL",style: oldPrice),
                      SizedBox(width: 10,),
                      Text("${discountt.newPrice} TL", style: newPrice),
                    ],
                  ),
                ),
              ],
            )));
  }
}

