import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hello_world/logics/states/explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit() : super(ExploreState(
    isLoading: false,
    categories: []
  ));

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

  void loadCategories() async{
    emit(state.copyWith(
      isLoading: true,
    ));
    await Future.delayed(Duration(seconds: 5));

    emit(state.copyWith(
      isLoading: false,
      categories: categories
    ));
  }
}