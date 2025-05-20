import 'package:flutter/material.dart';
import 'package:flutter_hello_world/component/category_card.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final categories = [
    [
      "assets/images/categories/fruit.png",
      "Fresh Fruits & Vegetable",
      Color(0x1A53B175),
      Color(0xB253B175),
    ],
    [
      "assets/images/categories/oil.png",
      "Cooking Oil & Ghee",
      Color(0x1AF8A44C),
      Color(0xB2F8A44C),
    ],
    [
      "assets/images/categories/meat & fish.png",
      "Meat & Fish",
      Color(0x40F7A593),
      Color(0xFFF7A593),
    ],
    [
      "assets/images/categories/bread.png",
      "Bakery & Snacks",
      Color(0x40D3B0E0),
      Color(0xFFD3B0E0),
    ],
    [
      "assets/images/categories/dairy & egg.png",
      "Dairy & Eggs",
      Color(0x40FDE598),
      Color(0xFFFDE598),
    ],
    [
      "assets/images/categories/beverage.png",
      "Beverages",
      Color(0x40B7DFF5),
      Color(0xFFB7DFF5),
    ],
    [
      "assets/images/categories/fruit.png",
      "Fresh Fruits & Vegetable",
      Color(0x26836AF6),
      Color(0x80836AF6),
    ],
    [
      "assets/images/categories/fruit.png",
      "Fresh Fruits & Vegetable",
      Color(0x26D73B77),
      Color(0x80D73B77),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 5),
          child: Text(
            "Find Products",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
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
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 20),
            childAspectRatio: .9,
            children:
                categories.map((element) {
                  return CategoryCard(
                    image: element[0].toString(),
                    name: element[1].toString(),
                    backgroundColor: element[2] as Color,
                    borderColor: element[3] as Color,
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}
