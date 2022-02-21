import 'package:flutter/material.dart';
import 'package:week6_starter/model/notifications_class.dart';

class notificationTiles extends StatelessWidget {
  final notificationClass notification_in_tiles;
  const notificationTiles({required this.notification_in_tiles});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.circle_notifications_outlined,
                  size: 65,
                ),
                Expanded(
                  child: Text(
                      notification_in_tiles.bigName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize:20,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                      notification_in_tiles.smallText,
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      )

                  ),
                ),
              ],
            ),
            Divider(
              thickness: 3,
              color: Colors.black,
              indent: 0,
            )
          ],
        ),
      ),

    );
  }
}


