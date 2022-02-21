import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week6_starter/model/cartitem.dart';
import 'package:week6_starter/ui/cart_tiles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:week6_starter/utils/color.dart';
import 'package:week6_starter/utils/styles.dart';
import 'package:week6_starter/utils/userID.dart';
import 'package:week6_starter/routes/emptycart.dart';
import 'dart:math';

class CartList extends StatefulWidget {
  @override

  //CartList({required this.uid });
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {

  //_CartListState({required this.uid });

  @override
  Widget build(BuildContext context) {
    //final userid = Provider.of<String>(context);
    final String uid = UserID().items();
    final items = Provider.of<List<cartItem>>(context);

    if (items.length == 0){
      return EmptyCart();
    }

    int itemprice(){
      int itemprice = 0;
      for (var item in items){
        itemprice += int.parse(item.price);
      };
      return itemprice;
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return CartTile(items: items[index]);
      },
    );
  }
}


Widget empty(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart List', style: appBarTitle),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
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
                          "Your favorite list is currently empty!",
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
                        " You can add the products you want to your favorites by clicking the heart button next to every time",
                        textAlign: TextAlign.center,
                        style: favoriteText1,
                      ))
                    ]
                )
              ])),
        ));
}

