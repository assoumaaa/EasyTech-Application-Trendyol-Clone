import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week6_starter/categories/model/headsets.dart';
import 'package:week6_starter/categories/ui/headset_tiles.dart';


class HeadsetList extends StatefulWidget {
  const HeadsetList({Key? key}) : super(key: key);

  @override
  _HeadsetListState createState() => _HeadsetListState();
}

class _HeadsetListState extends State<HeadsetList> {
  @override
  Widget build(BuildContext context) {
    final headsets = Provider.of<List<headset>>(context);
    return ListView.builder(
      itemCount: headsets.length,
      itemBuilder: (context, index) {
        return HeadsetTile(headsets: headsets[index]);
      },
    );
  }
}








