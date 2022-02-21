import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week6_starter/categories/database/tabletstream.dart';
import 'package:week6_starter/categories/lists/tabletslist.dart';
import 'package:week6_starter/categories/model/tablets.dart';
import 'package:week6_starter/utils/styles.dart';

class tabletView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<tablet>?>.value(
      value: TabletService().tablets,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Tablets', style: appBarTitle),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: TabletList(),
      ),
    );
  }
}