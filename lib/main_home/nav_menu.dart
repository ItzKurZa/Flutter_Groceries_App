import 'package:flutter/material.dart';
import 'package:flutter_hello_world/pages/cart.dart';
import 'package:flutter_hello_world/pages/explore.dart';
import 'package:flutter_hello_world/pages/favorite.dart';
import 'package:flutter_hello_world/pages/profile.dart';
import 'package:flutter_hello_world/pages/shop.dart';

class NavMenu extends StatefulWidget {
  const NavMenu({super.key});

  @override
  _NavMenuState createState() => _NavMenuState();
}

class _NavMenuState extends State<NavMenu> {
  int currentPageIndex = 0;

  final pages = [Shop(), Explore(), Cart(), Favorite(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentPageIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x17555E58),
              blurRadius: 15,
              offset: Offset(2, -5),
            ),
          ],
        ),
        child: NavigationBar(
          onDestinationSelected: (value) {
            setState(() {
              currentPageIndex = value;
            });
          },
          selectedIndex: currentPageIndex,
          indicatorColor: Colors.white,
          backgroundColor: Colors.white,
          animationDuration: Duration(),
          labelPadding: EdgeInsets.all(0),
          labelTextStyle: WidgetStateTextStyle.resolveWith(
            (states) =>
                states.contains(WidgetState.selected)
                    ? TextStyle(
                      color: Color(0xFF53B175),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    )
                    : TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
          ),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.store_outlined, size: 30),
              selectedIcon: Icon(
                Icons.store_outlined,
                color: Color(0xFF53B175),
                size: 35,
              ),
              label: "Shop",
            ),
            NavigationDestination(
              icon: Icon(Icons.search_rounded, size: 30),
              selectedIcon: Icon(
                Icons.search_rounded,
                color: Color(0xFF53B175),
                size: 35,
              ),
              label: "Explore",
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined, size: 30),
              selectedIcon: Icon(
                Icons.shopping_cart_outlined,
                color: Color(0xFF53B175),
                size: 35,
              ),
              label: "Cart",
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_outline, size: 30),
              selectedIcon: Icon(
                Icons.favorite_outline,
                color: Color(0xFF53B175),
                size: 35,
              ),
              label: "Favorite",
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline, size: 30),
              selectedIcon: Icon(
                Icons.person_outline,
                color: Color(0xFF53B175),
                size: 35,
              ),
              label: "Account",
            ),
          ],
        ),
      ),
    );
  }
}
