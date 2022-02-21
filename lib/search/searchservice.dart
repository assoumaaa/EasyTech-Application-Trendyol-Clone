import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week6_starter/database/cartservice.dart';
import 'package:week6_starter/database/favoriteservice.dart';
import 'package:week6_starter/routes/cart.dart';
import 'package:week6_starter/utils/color.dart';
import 'package:week6_starter/utils/styles.dart';
import 'package:week6_starter/utils/userID.dart';

class productSearchPage extends SearchDelegate {
  CollectionReference _firebaseFirestore =
      FirebaseFirestore.instance.collection('Search');

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {

    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final String uid = UserID().items();

    return StreamBuilder<QuerySnapshot>(

    stream: _firebaseFirestore.snapshots().asBroadcastStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            //fetch data
            return ListView(children: [
              ...snapshot.data!.docs
                  .where((QueryDocumentSnapshot<Object?> element) =>
                      element['Name']
                          .toString()
                          .toLowerCase()
                          .contains(query.toLowerCase()))
                  .map((QueryDocumentSnapshot<Object?> data) {
                final String name = data['Name'];
                final String image = data['Image'];
                final String manu = data['Manufacturer'];
                final String price = data['Price'];

                Future<void> showAlertDialog() async {
                  return showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text(name, style: alertTitle),
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 12,
                                ),
                                Image(
                                  image: NetworkImage(image),
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
                                          "Manufacturer: $manu",
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
                                          "Price: $price TL",
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
                                FavService(uid: uid).updateUserData(name, manu, image, price);
                              },
                              child: Icon(
                                Icons.favorite_border_rounded,
                                color: AppColors.primary,
                                size: 35,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  {
                                    CartService(uid: uid).updateUserData(name, manu, image, price);
                                  }
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
                          image: NetworkImage(image),
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
                                child: Text(name,
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
              })
            ]);
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Center(child: Text("Search anything in here..."));
  }
}
