import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week6_starter/categories/model/keyboards.dart';
import 'package:week6_starter/categories/ui/keyboard_tiles.dart';

class KeyboardList extends StatefulWidget {
  const KeyboardList({Key? key}) : super(key: key);

  @override
  _KeyboardListState createState() => _KeyboardListState();
}

class _KeyboardListState extends State<KeyboardList> {
  @override
  Widget build(BuildContext context) {
    final keyboards = Provider.of<List<keyboard>>(context);
    return ListView.builder(
      itemCount: keyboards.length,
      itemBuilder: (context, index) {
        return KeyboardTile(keyboards: keyboards[index]);
      },
    );
  }
}













