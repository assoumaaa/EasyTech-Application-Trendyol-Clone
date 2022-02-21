import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week6_starter/categories/database/keyboardstream.dart';
import 'package:week6_starter/categories/lists/keyboardlist.dart';
import 'package:week6_starter/categories/model/keyboards.dart';
import 'package:week6_starter/utils/styles.dart';

class keyboardView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<keyboard>?>.value(
      value: KeyboardService().keyboards,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Keyboards', style: appBarTitle),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: KeyboardList(),
      ),
    );
  }
}