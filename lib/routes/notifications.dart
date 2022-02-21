import 'package:flutter/material.dart';
import 'package:week6_starter/utils/styles.dart';
import 'package:week6_starter/model/notifications_class.dart';
import 'package:week6_starter/ui/notifications_tiles.dart';



class notifications extends StatefulWidget {
  const notifications({Key? key}) : super(key: key);

  @override
  _notificationsState createState() => _notificationsState();
}

class _notificationsState extends State<notifications> {
  List<notificationClass> notificationList = [
    notificationClass(bigName: "Big Discount Don't Miss it!!!", smallText: "50% discount on all gaming keyboards it will expire in 2 days!"),
    notificationClass(bigName: "12 hour Flash Sale", smallText: "Get 25% discount on all Apple Products!"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
            title: Text('Notifications', style: appBarTitle),
            backgroundColor: Colors.black,
            elevation: 0.0),
        body:
        SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                children:notificationList.map((notificationClass) => notificationTiles(notification_in_tiles: notificationClass)).toList()
            )
        )
    );
  }
}

