import 'package:flutter/material.dart';
import 'package:flutter_hello_world/component/groceries_type_card.dart';
import 'package:flutter_hello_world/component/item_card.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final exclusiveOffers = [
    [
      "assets/images/exclusive_offers/banana.png",
      "Organic Bananas",
      "7pcs, Price",
      "\$4.99",
    ],
    [
      "assets/images/exclusive_offers/apple.png",
      "Red Apple",
      "1kg, Price",
      "\$4.99",
    ],
    [
      "assets/images/exclusive_offers/banana.png",
      "Organic Bananas",
      "7pcs, Price",
      "\$4.99",
    ],
  ];

  final bestSelling = [
    [
      "assets/images/best_selling/bell peper.png",
      "Bell Pepper Red",
      "1kg, Price",
      "\$4.99",
    ],
    [
      "assets/images/best_selling/ginger.png",
      "Ginger",
      "250gm, Price",
      "\$4.99",
    ],
    [
      "assets/images/best_selling/bell peper.png",
      "Bell Pepper Red",
      "1kg, Price",
      "\$4.99",
    ],
  ];

  final groceryTypes = [
    ["assets/images/grocery_types/pulses.png", "Pulses", Color(0x26F8A44C)],
    ["assets/images/grocery_types/rice.png", "Rice", Color(0x2653B175)],
  ];

  final groceries = [
    ["assets/images/groceries/beef.png", "Beef Bone", "1kg, Price", "\$4.99"],
    [
      "assets/images/groceries/chicken.png",
      "Broiler Chicken",
      "1kg, Price",
      "\$4.99",
    ],
    ["assets/images/groceries/beef.png", "Beef Bone", "1kg, Price", "\$4.99"],
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        children: <Widget>[
          Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 40),
                height: 70,
                child: Image(
                  image: AssetImage("assets/images/decorations/logo.png"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.location_on),
                  Text(
                    "Dhaka, Banassre",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 25, right: 25),
            child: SearchBar(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              backgroundColor: WidgetStatePropertyAll(Color(0xFFF2F3F2)),
              leading: Icon(Icons.search, size: 30),
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 10),
              ),
              shadowColor: WidgetStatePropertyAll(Colors.transparent),
              hintText: "Search Store",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 25, right: 25),
            child: Image(
              image: AssetImage("assets/images/decorations/banner.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 25, right: 25),
            child: Column(
              spacing: 15,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Exclusive Offer",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF53B175),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 225,
                  child: GridView.count(
                    crossAxisCount: 1,
                    mainAxisSpacing: 15,
                    scrollDirection: Axis.horizontal,
                    childAspectRatio: 1.5,
                    children:
                        exclusiveOffers.map((element) {
                          return ItemCard(
                            image: element[0].toString(),
                            name: element[1].toString(),
                            description: element[2].toString(),
                            price: element[3].toString(),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 25, right: 25),
            child: Column(
              spacing: 15,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Best Selling",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF53B175),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 225,
                  child: GridView.count(
                    crossAxisCount: 1,
                    mainAxisSpacing: 15,
                    scrollDirection: Axis.horizontal,
                    childAspectRatio: 1.5,
                    children:
                        bestSelling.map((element) {
                          return ItemCard(
                            image: element[0].toString(),
                            name: element[1].toString(),
                            description: element[2].toString(),
                            price: element[3].toString(),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 25, right: 25),
            child: Column(
              spacing: 15,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Groceries",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF53B175),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                  child: GridView.count(
                    crossAxisCount: 1,
                    mainAxisSpacing: 15,
                    scrollDirection: Axis.horizontal,
                    childAspectRatio: .45,
                    children:
                        groceryTypes.map((element) {
                          return GroceriesTypeCard(
                            image: element[0].toString(),
                            name: element[1].toString(),
                            backgroundColor: element[2] as Color,
                          );
                        }).toList(),
                  ),
                ),
                SizedBox(
                  height: 225,
                  child: GridView.count(
                    crossAxisCount: 1,
                    mainAxisSpacing: 15,
                    scrollDirection: Axis.horizontal,
                    childAspectRatio: 1.5,
                    children:
                        groceries.map((element) {
                          return ItemCard(
                            image: element[0].toString(),
                            name: element[1].toString(),
                            description: element[2].toString(),
                            price: element[3].toString(),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
