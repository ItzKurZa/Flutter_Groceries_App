import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hello_world/logics/cubits/shop_cubit.dart';
import 'package:flutter_hello_world/logics/states/shop_state.dart';
import 'package:flutter_hello_world/screens/component/groceries_type_card.dart';
import 'package:flutter_hello_world/screens/component/item_card.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        if (state.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.exclusiveOffers.isEmpty &&
            state.bestSelling.isEmpty &&
            state.groceryTypes.isEmpty &&
            state.groceries.isEmpty) {
          return Center(
            child: Text(
              "No products available",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          );
        } else {
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
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, left: 25, right: 25),
                  child: SearchBar(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
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
                              state.exclusiveOffers.map((element) {
                                return ItemCard(
                                  image: element[0].toString(),
                                  name: element[1].toString(),
                                  details: element[2].toString(),
                                  price: element[3].toString(),
                                  description: element[4].toString(),
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
                              state.bestSelling.map((element) {
                                return ItemCard(
                                  image: element[0].toString(),
                                  name: element[1].toString(),
                                  details: element[2].toString(),
                                  price: element[3].toString(),
                                  description: element[4].toString(),
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
                              state.groceryTypes.map((element) {
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
                              state.groceries.map((element) {
                                return ItemCard(
                                  image: element[0].toString(),
                                  name: element[1].toString(),
                                  details: element[2].toString(),
                                  price: element[3].toString(),
                                  description: element[4].toString(),
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
      },
    );
  }
}
