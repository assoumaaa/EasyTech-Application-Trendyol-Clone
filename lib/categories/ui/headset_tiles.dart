import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week6_starter/categories/model/headsets.dart';
import 'package:week6_starter/routes/cart.dart';
import 'package:week6_starter/utils/color.dart';
import 'package:week6_starter/utils/styles.dart';
import 'package:week6_starter/database/cartservice.dart';
import 'package:week6_starter/utils/userID.dart';
import 'package:week6_starter/database/favoriteservice.dart';

class HeadsetTile extends StatelessWidget {
  final headset headsets;
  HeadsetTile({required this.headsets});

  @override
  Widget build(BuildContext context) {
    final String uid = UserID().items();
    Future<void> showAlertDialog() async {
      return showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text(headsets.headsetName, style: alertTitle),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Image(
                      image: NetworkImage(headsets.image),
                      fit: BoxFit.cover,
                      width: 550,
                      height: 300,
                    ),
                    SizedBox(height: 12),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Manufacturer: ${headsets.manufacturer}",
                              style: alertText,
                            ),

                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [

                            Text(
                              "Price: ${headsets.price} TL",
                              style: alertText,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Storage Capacity: ${headsets.connectionType}",
                              style: alertText,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8),

                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [

                            Text(
                              "Model Number: ${headsets.modelNumber}",
                              style: alertText,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    FavService(uid: uid).updateUserData(headsets.headsetName, headsets.manufacturer, headsets.image, headsets.price);
                  },
                  child: Icon(
                    Icons.favorite_border_rounded,
                    color: AppColors.primary,
                    size: 35,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      CartService(uid: uid).updateUserData(headsets.headsetName, headsets.manufacturer, headsets.image, headsets.price);
                    },
                    child: Icon(
                      Icons.shopping_cart,
                      color: AppColors.primary,
                      size: 35,
                    )),
              ],
            );
          });
    }

    return Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(17, 20, 0, 20),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: NetworkImage(headsets.image),
                  fit: BoxFit.cover,
                  width: 350,
                  height: 150,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      TextButton(
                        child: Text(headsets.headsetName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            )),
                        onPressed: () {
                           showAlertDialog();
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

