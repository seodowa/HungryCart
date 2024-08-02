import 'package:flutter/material.dart';
import 'package:hungrycart/view/about.dart';
import 'package:hungrycart/view/accounts.dart';
import 'package:hungrycart/view/cart.dart';
import 'package:hungrycart/view/rewards.dart';
import 'package:hungrycart/view/shop.dart';
import '../app_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    Widget page = const ShopPage();

    switch (index) {
      case 0:
        page = const ShopPage();
      case 1:
        page = const RewardsPage();
      case 2:
        page = const AccountsPage();      
      case 3:
        page = const AboutPage();
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Stack(
          children: [
            Text(
              "HungryCart",
              style: AppStyle.headerTextStyle.copyWith(
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..color = Colors.black
                    ..strokeWidth = 3,
                  color: null),
            ),
            const Text("HungryCart", style: AppStyle.headerTextStyle),
          ],
        ),
        // Border for the appbar
        backgroundColor: AppStyle.mainColor,
        shape: const Border(
          bottom: BorderSide(color: Colors.black, width: 2),
        ),
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ShoppingCartPage()));
            },
            icon: const Icon(Icons.shopping_cart_outlined),
            selectedIcon: const Icon(Icons.shopping_cart_rounded),
            iconSize: screenWidth / 12,
          )
        ],
      ),

      body: page,

      // This is basically a bottom nav bar but with a border on top
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Colors.black,
            border: Border(top: BorderSide(color: Colors.black, width: 2))),
        child: NavigationBar(
          indicatorColor: AppStyle.mainColor,
          backgroundColor: AppStyle.mainColor,
          selectedIndex: index,
          onDestinationSelected: (value) {
            setState(() {
              index = value;
            });
          },
          destinations: [
            NavigationDestination(
                icon: Icon(
                  Icons.shopping_basket_outlined,
                  size: screenWidth / 12,
                  applyTextScaling: true,
                ),
                selectedIcon: Icon(
                  Icons.shopping_basket,
                  size: screenWidth / 12,
                  applyTextScaling: true,
                ),
                label: "Shop"),
            NavigationDestination(
                icon: Icon(
                  Icons.star_border,
                  size: screenWidth / 12,
                  applyTextScaling: true,
                ),
                selectedIcon: Icon(
                  Icons.star,
                  size: screenWidth / 12,
                  applyTextScaling: true,
                ),
                label: "Rewards"),
            
            NavigationDestination(
                icon: Icon(
                  Icons.person_2_outlined,
                  size: screenWidth / 12,
                  applyTextScaling: true,
                ),
                selectedIcon: Icon(
                  Icons.person_2,
                  size: screenWidth / 12,
                  applyTextScaling: true,
                ),
                label: "Accounts"),
            NavigationDestination(
                icon: Icon(
                  Icons.info_outline,
                  size: screenWidth / 12,
                  applyTextScaling: true,
                ),
                selectedIcon: Icon(
                  Icons.info,
                  size: screenWidth / 12,
                  applyTextScaling: true,
                ),
                label: "About"),
          ],
        ),
      ),
    );
  }
}
