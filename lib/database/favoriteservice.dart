import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:week6_starter/model/favorites_class.dart';


class FavService {

  final String uid;
  FavService({required this.uid });



  late CollectionReference favCollection = FirebaseFirestore.instance.collection('Favorites').doc(uid).collection('ProductID');

  Future<void> updateUserData(String Name, String Manufacturer, String Image, String Price) async {
    return await favCollection.doc(Name).set({
      'itemName': Name,
      'Manufacturer': Manufacturer,
      'Image': Image,
      'Price' : Price,
    });
  }

  Future<void> deleteUser(String Name) async {
    return await favCollection
        .doc(Name)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  List<favorites> _favListFromSnapshot(QuerySnapshot? snapshot) {
    return snapshot!.docs.map((doc){
      return favorites(
        itemName: doc.get('itemName') ?? '',
        manufacturers: doc.get('Manufacturer')?? '',
        image: doc.get('Image') ?? '',
        Price: doc.get('Price') ?? '0',
      );
    }).toList();
  }



  Stream<List<favorites>> get carts {
    return favCollection.snapshots().map(_favListFromSnapshot);
  }


}