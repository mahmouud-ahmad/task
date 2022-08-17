import 'package:flutter/material.dart';

import 'view/screen/soon.dart';
import 'view/screen/home.dart';

class homePage extends StatefulWidget {
  String? city;
  String? clss;
  homePage({this.city, this.clss});
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int indexScreen = 0;

  final items = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
        size: 35,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.photo_size_select_actual_outlined,
          size: 35,
        ),
        label: 'Gallery'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home_repair_service_sharp,
          size: 35,
        ),
        label: 'My services'),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.shopping_cart_outlined,
        size: 35,
      ),
      label: 'My requests',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.person_outline_outlined,
        size: 35,
      ),
      label: 'Profile',
    ),
  ];

  List<Widget> screens = [
    home(),
    soon(),
    soon(),
    soon(),
    soon(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/backgroundHomePage.png"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: screens[indexScreen],
        ),
      ),
    );
  }

  BottomNavigationBar bottomBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.white, // fixedColor: Colors.white,
      selectedItemColor: Colors.amber,

      selectedIconTheme: IconThemeData(color: Colors.amber),
      currentIndex: indexScreen,
      onTap: (index) {
        setState(() {
          this.indexScreen = index;
        });
      },
      items: items,
    );
  }
}
