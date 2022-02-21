import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week6_starter/model/notifications_class.dart';
import 'package:week6_starter/search/searchservice.dart';
import 'package:week6_starter/ui/notifications_tiles.dart';
import 'package:week6_starter/utils/color.dart';
import 'package:week6_starter/utils/styles.dart';
import 'package:week6_starter/model/discounted_phones.dart';
import 'package:week6_starter/ui/discounted_tiles.dart';
import 'package:week6_starter/routes/login.dart';
import 'package:week6_starter/routes/notifications.dart';

class Start extends StatefulWidget {
  //const start({Key? key}) : super(key: key);
  static String tag = 'profile';


  @override
  _startState createState() => _startState();
}

class _startState extends State<Start> {

  List<discount> discountPhones = [
    discount(
        phoneName: 'IPHONE XS',
        description: 'Iphone XS 128 GB',
        image: "https://assets.swappie.com/SwappieXsGold-1-1-1.png",
        oldPrice: 10000,
        newPrice: 8500),
    discount(
        phoneName: 'SAMSUNG S20',
        description: 'Samsung S20 128 GB',
        image:
            "https://cdn.cimri.io/image/1000x1000/samsung-galaxy-s20-fe-256gb-8gb-ram-65-inc-12mp-akilli-cep-telefonu-yesil_301244663.jpg",
        oldPrice: 13000,
        newPrice: 12000),
    discount(
        phoneName: 'IPHONE 13',
        description: 'Iphone 13 128 GB',
        image:
            "https://st-troy.mncdn.com/mnresize/1500/1500/Content/media/ProductImg/original/mllg3tua-apple-iphone-13-pro-max-512gb-gumus-637678426845768658.jpg",
        oldPrice: 18000,
        newPrice: 17000),
    discount(
        phoneName: 'PIXEL 5',
        description: 'Google Pixel 5 64 GB',
        image:
            "https://fdn.gsmarena.com/imgroot/news/20/09/pixel-5-4a5g-announced/pixel4a5g/-1200x1200m/gsmarena_003.jpg",
        oldPrice: 11000,
        newPrice: 9500),
  ];

  void buttonClicked() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => notifications()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('EasyTech', style: appBarTitle),
          backgroundColor: Colors.transparent,
          elevation: 0.0),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(onPressed: () {showSearch(
                        context: context,
                        delegate: productSearchPage() );}, child: Text(
                        "Search for a specific item?..",
                      style: favoriteText,
                    )
                    ),
                    TextButton.icon(
                        onPressed: buttonClicked,
                        icon: Icon(Icons.notifications,
                            color: AppColors.primary, size: 35),
                        label: Text(
                          '',
                        )),
                  ],
                ),
                Divider(
                  color: AppColors.primary,
                  thickness: 2,
                ),
                Image(
                    image: NetworkImage(
                        'https://image.freepik.com/free-vector/asbtract-colorful-sales-wallpaper_23-2148403385.jpg')
                ),
                SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: discountPhones
                        .map((discount) => discountTile(discountt: discount))
                        .toList(),
                  ),
                ),
                Image(
                    image: NetworkImage(
                        'https://www.gannett-cdn.com/presto/2021/11/20/USAT/8dfb65ae-f123-43ef-972f-4b4b3f61702c-AMAZON_BF_1121_HERO.png?width=660&height=372&fit=crop&format=pjpg&auto=webp')
                ),
              ],
            )),
      ),
    );
  }
}
