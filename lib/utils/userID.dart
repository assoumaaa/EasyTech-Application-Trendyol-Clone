import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class UserID{
  UserID();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final controller = StreamController<String>();

  final  _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
  length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  String  items() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final  _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();

    String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    final User? user = auth.currentUser;
    String? uid = user?.uid;
    if (user==null){
      uid = getRandomString(10);
    }
    controller.add(uid!);
    return uid;
  }
}