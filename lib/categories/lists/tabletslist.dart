import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week6_starter/categories/model/tablets.dart';
import 'package:week6_starter/categories/ui/tablets_tiles.dart';


class TabletList extends StatefulWidget {
  const TabletList({Key? key}) : super(key: key);

  @override
  _TabletListState createState() => _TabletListState();
}

class _TabletListState extends State<TabletList> {
  @override
  Widget build(BuildContext context) {
    final tablets = Provider.of<List<tablet>>(context);
    return ListView.builder(
      itemCount: tablets.length,
      itemBuilder: (context, index) {
        return TabletTile(tablets: tablets[index]);
      },
    );
  }
}


