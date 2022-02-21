import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week6_starter/model/phones.dart';
import 'package:week6_starter/ui/phone_tiles2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PhoneList extends StatefulWidget {
  const PhoneList({Key? key}) : super(key: key);

  @override
  _PhoneListState createState() => _PhoneListState();
}

class _PhoneListState extends State<PhoneList> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Phones').snapshots();
  @override
  Widget build(BuildContext context) {
    //final phones = Provider.of<List<phone>>(context);

    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }


        return ListView(

          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

            return PhoneTile2(phones: phone(phoneName: data['Name'], manufacturer: data['Manufacturer'], image: data['Image'], price: data['Price'], storage: data['Storage']));
          }).toList(),
        );
      },
    );
  }
}
