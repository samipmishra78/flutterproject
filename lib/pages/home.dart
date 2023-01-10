import 'package:flutter/material.dart';
import 'package:projectflutter/pages/page1.dart';
import 'package:projectflutter/pages/page2.dart';
import 'package:projectflutter/pages/page3.dart';
import 'package:projectflutter/pages/page4.dart';

class Home extends StatefulWidget {
  // const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int currentindex = 0;
  List pages = [
    Page1(),
    Page2(),
    Page3(),
    Page4(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 27, 6, 218),

      extendBody: true,
      body: pages[currentindex],

      bottomNavigationBar: NavigationBar(
        height: 60,
        selectedIndex: currentindex,
        onDestinationSelected: (currentindex) =>
            setState(() => this.currentindex = currentindex),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_checkout),
            selectedIcon: Icon(Icons.shopping_cart_checkout),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.card_giftcard),
            selectedIcon: Icon(Icons.card_giftcard),
            label: 'Offers',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        // Image.asset('assets/covidbanner.png'),

        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
