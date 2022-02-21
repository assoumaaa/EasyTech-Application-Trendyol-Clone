import 'package:flutter/material.dart';
import 'package:week6_starter/routes/login.dart';
import 'package:week6_starter/routes/start.dart';
import 'package:week6_starter/utils/color.dart';
import 'cart.dart';
import 'categories.dart';
import 'favorites.dart';

class RouteControl extends StatefulWidget {
  const RouteControl({Key? key}) : super(key: key);

  @override
  _RouteControlState createState() => _RouteControlState();
}

class _RouteControlState extends State<RouteControl> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    Start(),
    Categories(),
    Favorites(),
    Cart(),
    Login(),
  ];
  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: AppColors.primary,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
            backgroundColor: AppColors.primary,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
            backgroundColor: AppColors.primary,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
            backgroundColor: AppColors.primary,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: AppColors.primary,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.textColor,
        onTap: _onTap,
      ),
    );
  }
}
