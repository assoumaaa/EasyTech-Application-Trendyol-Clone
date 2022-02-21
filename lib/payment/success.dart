import 'package:flutter/material.dart';
import 'package:week6_starter/routes/start.dart';
import 'package:week6_starter/utils/styles.dart';


class success extends StatefulWidget {
  const success({Key? key}) : super(key: key);

  @override
  _successState createState() => _successState();
}

class _successState extends State<success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have paid Succesfuly!",style: alertTitle,),
        ]
      )
    )
    );
  }
}
