import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:week6_starter/routes/login.dart';
import 'package:week6_starter/routes/profile.dart';
import 'package:week6_starter/routes/routesControl.dart';
import 'package:week6_starter/routes/start.dart';
import 'package:week6_starter/routes/Walkview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            print('Cannot connect to firebase: '+snapshot.error.toString());
            return MaterialApp(
              home: Profile(),
            );
          }
          if(snapshot.connectionState == ConnectionState.done) {
            print('Firebase connected');
            return MaterialApp(home: OnBoardingPage());
          }

          return MaterialApp(
            home: Start(),
          );
        }
    );
  }
}




