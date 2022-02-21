import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:week6_starter/model/cartitem.dart';


class CartService {

  final String uid;
  CartService({required this.uid });



  late CollectionReference cartCollection = FirebaseFirestore.instance.collection('Carts').doc(uid).collection('ProductID');

  Future<void> updateUserData(String Name, String Manufacturer, String Image, String Price) async {
    return await cartCollection.doc(Name).set({
      'Name': Name,
      'Manufacturer': Manufacturer,
      'Image': Image,
      'Price' : Price,
    });
  }

  Future<void> deleteUser(String Name) async {
    return await cartCollection
        .doc(Name)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  List<cartItem> _cartListFromSnapshot(QuerySnapshot? snapshot) {
    return snapshot!.docs.map((doc){
      return cartItem(
        Name: doc.get('Name') ?? '',
        manufacturer: doc.get('Manufacturer')?? '',
        image: doc.get('Image') ?? '',
        price: doc.get('Price') ?? '0',
      );
    }).toList();
  }




  Stream<List<cartItem>> get carts {
    return cartCollection.snapshots().map(_cartListFromSnapshot);
  }

  
}
