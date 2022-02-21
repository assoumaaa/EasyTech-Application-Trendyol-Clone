import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week6_starter/database/phonestream.dart';
import 'package:week6_starter/model/phones.dart';
import 'package:week6_starter/ui/phonelist.dart';
import 'package:week6_starter/utils/styles.dart';

class phoneView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<phone>?>.value(
      value: PhoneService().phones,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
            title: Text('Phones', style: appBarTitle),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
        ),
        body: PhoneList(),
      ),
    );
  }
}