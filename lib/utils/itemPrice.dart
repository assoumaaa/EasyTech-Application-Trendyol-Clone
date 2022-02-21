import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week6_starter/model/cartitem.dart';
import 'package:week6_starter/ui/cart_tiles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:week6_starter/utils/userID.dart';
import 'dart:math';

class ItemPrice extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final items = Provider.of<List<cartItem>>(context);
    int itemprice = 0;
    for (var item in items){
      itemprice += int.parse(item.price);
    };



    return Card(
    child: Row(
    children: [
      Text("$itemprice"),
      FloatingActionButton(
    onPressed: (){},),
    ]));


  }
}
