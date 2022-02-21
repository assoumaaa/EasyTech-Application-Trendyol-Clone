import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week6_starter/database/favoriteservice.dart';
import 'package:week6_starter/model/favorites_class.dart';
import 'package:week6_starter/ui/favoritelist.dart';
import 'package:week6_starter/utils/styles.dart';
import 'package:week6_starter/utils/userID.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String uid = UserID().items();
    return StreamProvider<List<favorites>?>.value(
      value: FavService(uid: uid).carts,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Favorites', style: appBarTitle),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: FavList(),
      ),
    );
  }
}
