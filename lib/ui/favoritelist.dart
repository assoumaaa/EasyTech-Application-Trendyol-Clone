import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week6_starter/model/favorites_class.dart';
import 'package:week6_starter/ui/favorites_tiles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:week6_starter/utils/color.dart';
import 'package:week6_starter/utils/styles.dart';
import 'package:week6_starter/utils/userID.dart';
import 'package:week6_starter/routes/emptyfavorites.dart';
import 'dart:math';

class FavList extends StatefulWidget {
  const FavList({Key? key}) : super(key: key);

  @override
  _FavListState createState() => _FavListState();
}

class _FavListState extends State<FavList> {
  @override
  Widget build(BuildContext context) {
    //final userid = Provider.of<String>(context);
    final String uid = UserID().items();
    final items = Provider.of<List<favorites>>(context);

    if (items == null){
      return Center(child: Text('Loading'));
    }

    if (items.length == 0){
      return EmptyFavorites();
    }

    int itemprice(){
      int itemprice = 0;
      for (var item in items){
        itemprice += int.parse(item.Price);
      };
      return itemprice;
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return FavoriteTile(items: items[index]);
      },
    );
  }
}
