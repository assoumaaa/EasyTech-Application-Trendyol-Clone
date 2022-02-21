import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week6_starter/categories/model/phones.dart';
import 'package:week6_starter/routes/cart.dart';
import 'package:week6_starter/utils/color.dart';
import 'package:week6_starter/utils/styles.dart';

class PhoneTile extends StatelessWidget {
  final phone phones;
  PhoneTile({required this.phones});

  @override
  Widget build(BuildContext context) {
    Future<void> showAlertDialog() async {
      return showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text(phones.phoneName, style: alertTitle),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Image(
                      image: NetworkImage(phones.image),
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
                              "Manufacturer: ${phones.manufacturer}",
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
                              "Price: ${phones.price} TL",
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
                              "Storage Capacity: ${phones.storage}",
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
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.favorite_border_rounded,
                    color: AppColors.primary,
                    size: 35,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      {Navigator.push( context, MaterialPageRoute(builder: (context) => Cart()),);}
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
              image: NetworkImage(phones.image),
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
                    child: Text(phones.phoneName,
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
