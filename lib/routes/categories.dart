import 'package:flutter/material.dart';
import 'package:week6_starter/categories/routes/headsetview.dart';
import 'package:week6_starter/categories/routes/keyboardview.dart';
import 'package:week6_starter/categories/routes/phoneview.dart';
import 'package:week6_starter/categories/routes/tabletsview.dart';
import 'package:week6_starter/model/categories_class.dart';
import 'package:week6_starter/ui/categories_tiles.dart';
import 'package:week6_starter/utils/styles.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {



  @override
  Widget build(BuildContext context) {

    List<categories> categoriesList = [
      categories(CategoryName: "Phones", image: "https://s01.sgp1.cdn.digitaloceanspaces.com/article/127664-csdgcybqaf-1568959931.jpg",icon: IconButton(icon: Icon(Icons.phone_android), onPressed: () {Navigator.push( context, MaterialPageRoute(builder: (context) => phoneView()),);
      } )),
      categories(CategoryName: "Tablets", image: "https://9to5mac.com/wp-content/uploads/sites/6/2021/10/iPad-mini-6.jpg?quality=82&strip=all",icon : IconButton(icon: Icon(Icons.tablet),
        onPressed: () { {Navigator.push( context, MaterialPageRoute(builder: (context) => tabletView()),); } },)),
      categories(CategoryName: "Headsets", image: "https://static.independent.co.uk/2021/02/23/17/wireless-gaming-headsets-indybest.jpg?width=982&height=726&auto=webp&quality=75",icon: IconButton(icon: Icon(Icons.headset), onPressed: () { {Navigator.push( context, MaterialPageRoute(builder: (context) => headsetView()),);
      } },)),
      categories(CategoryName: "Keyboards", image: "https://www.monitornerds.com/wp-content/uploads/2016/10/best-gaming-keyboards-and-mechanical-keyboards-for-gaming.jpg", icon: IconButton(icon: Icon(Icons.keyboard), onPressed: () { {Navigator.push( context, MaterialPageRoute(builder: (context) => keyboardView()),);
      } },))
    ];

    return Scaffold(
      appBar: AppBar(
          title: Text('Categories', style: appBarTitle),
          backgroundColor: Colors.transparent,
          elevation: 0.0),
      body:
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: categoriesList.map((categories) => categoriesTile(categoriess: categories)).toList()

          ),
        )
    );
  }
}
