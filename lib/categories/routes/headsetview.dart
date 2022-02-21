import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week6_starter/categories/database/headsetstream.dart';
import 'package:week6_starter/categories/lists/headsetlist.dart';
import 'package:week6_starter/categories/model/headsets.dart';
import 'package:week6_starter/utils/styles.dart';

class headsetView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<headset>?>.value(
      value: HeadsetService().headsets,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Headsets', style: appBarTitle),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: HeadsetList(),
      ),
    );
  }
}