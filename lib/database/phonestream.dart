import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:week6_starter/model/phones.dart';

class PhoneService {

  final CollectionReference phoneCollection = FirebaseFirestore.instance.collection('Phones');

  List<phone> _phoneListFromSnapshot(QuerySnapshot? snapshot) {
    return snapshot!.docs.map((doc){
      return phone(
          phoneName: doc.get('Name') ?? '',
          manufacturer: doc.get('Manufacturer')?? '',
          image: doc.get('Image') ?? '',
          price: doc.get('Price') ?? '0',
          storage: doc.get('Storage') ?? '0',
      );
    }).toList();
  }


  Stream<List<phone>> get phones {
    return phoneCollection.snapshots().map(_phoneListFromSnapshot);
  }
}
