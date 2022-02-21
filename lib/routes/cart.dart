import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week6_starter/database/cartservice.dart';
import 'package:week6_starter/model/cartitem.dart';
import 'package:week6_starter/payment/paying.dart';
import 'package:week6_starter/ui/cartlist.dart';
import 'package:week6_starter/utils/styles.dart';
import 'package:week6_starter/utils/userID.dart';

class Cart extends StatelessWidget {
  late int itemPrice = 0;

  @override
  Widget build(BuildContext context) {
    final String uid = UserID().items();
    return StreamProvider<List<cartItem>?>.value(
      value: CartService(uid: uid).carts,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: TextButton(child: Text('Press to Pay',style: appBarTitle,), onPressed: () { { {Navigator.push( context, MaterialPageRoute(builder: (context) => Login()),); } }; } ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: CartList(),
      ),
    );
  }
}