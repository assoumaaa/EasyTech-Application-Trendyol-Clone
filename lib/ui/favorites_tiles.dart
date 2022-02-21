import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week6_starter/database/favoriteservice.dart';
import 'package:week6_starter/model/favorites_class.dart';
import 'package:week6_starter/utils/color.dart';
import 'package:week6_starter/utils/userID.dart';

class FavoriteTile extends StatelessWidget {
  final favorites items;
  FavoriteTile({required this.items});

  @override
  Widget build(BuildContext context) {
    final String uid = UserID().items();

    return Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(17, 20, 0, 20),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: NetworkImage(items.image),
                  fit: BoxFit.cover,
                  width: 350,
                  height: 150,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        "${items.itemName}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "${items.Price} TL",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                FavService(uid: uid).deleteUser(items.itemName);
                              },
                              icon: Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                                size: 35,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
