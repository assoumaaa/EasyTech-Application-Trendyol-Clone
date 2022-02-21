import 'package:flutter/material.dart';
import 'package:week6_starter/model/favorites_class.dart';
import 'package:week6_starter/model/favorites_class.dart';
import 'package:week6_starter/model/favorites_class.dart';
import 'package:week6_starter/utils/color.dart';
import 'package:week6_starter/utils/styles.dart';

class EmptyCart extends StatefulWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  _EmptyCartState createState() => _EmptyCartState();
}

class _EmptyCartState extends State<EmptyCart> {
  List<favorites> favorites_items = [
    favorites(
        itemName: '', manufacturers: '', image: "", Price: '0'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 60, 15, 50),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.favorite_border_rounded,
                    color: AppColors.primary,
                    size: 80,
                  ),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                          "Your cart is currently empty!",
                          style: favoriteText,
                          textAlign: TextAlign.center
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Expanded(child: Text(
                        "You can add the products you want to your cart by clicking Add to Cart next to each item",
                        textAlign: TextAlign.center,
                        style: favoriteText1,
                      ))
                    ]
                )
              ])),
        ));
  }
}
