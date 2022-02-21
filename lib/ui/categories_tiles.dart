import 'package:flutter/material.dart';
import 'package:week6_starter/model/categories_class.dart';
import 'package:week6_starter/utils/color.dart';
import 'package:week6_starter/utils/styles.dart';


  class categoriesTile extends StatelessWidget {
    final categories categoriess;

    const categoriesTile({required this.categoriess});

    @override
    Widget build(BuildContext context) {
      return Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(17,20,0,20),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: NetworkImage(categoriess.image),
                    fit: BoxFit.cover,
                    width: 350,
                    height: 150,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height:120,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.transparent,
                        ]
                      )
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ClipOval(
                          child: Container(
                            color: AppColors.primary,
                            padding: EdgeInsets.all(10),
                            child: categoriess.icon,
                          ),
                        ),
                        SizedBox(width:10),
                        Text(
                          categoriess.CategoryName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:25,
                            fontWeight: FontWeight.bold,
                          )
                        )
                      ],
                    ),
                  ),
                )
              ],

            ),
          )
      );
    }
  }


