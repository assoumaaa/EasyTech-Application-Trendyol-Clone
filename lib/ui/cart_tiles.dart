import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week6_starter/database/cartservice.dart';
import 'package:week6_starter/model/cartitem.dart';
import 'package:week6_starter/utils/color.dart';
import 'package:week6_starter/utils/userID.dart';
import 'dart:convert';


class CartTile extends StatelessWidget {
  final cartItem items;
  CartTile({required this.items});

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
                    "${items.Name}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${items.price} TL",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                IconButton(
                          onPressed: () {
                            CartService(uid: uid).deleteUser(items.Name);
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
