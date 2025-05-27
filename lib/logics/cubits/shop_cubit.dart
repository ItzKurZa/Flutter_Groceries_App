import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hello_world/logics/states/shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit()
    : super(
        ShopState(
          isLoading: false,
          exclusiveOffers: [],
          bestSelling: [],
          groceryTypes: [],
          groceries: [],
        ),
      );

  void loadProducts() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(Duration(seconds: 5));

    final exclusiveOffers = [
      [
        "assets/images/exclusive_offers/banana.png",
        "Organic Bananas",
        "7pcs, Price",
        "\$4.99",
        "Bananas are a great source of potassium and fiber. They are also low in calories and can help with digestion.",
      ],
      [
        "assets/images/exclusive_offers/apple.png",
        "Red Apple",
        "1kg, Price",
        "\$4.99",
        "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.",
      ],
      [
        "assets/images/exclusive_offers/banana.png",
        "Organic Bananas",
        "7pcs, Price",
        "\$4.99",
        "Bananas are a great source of potassium and fiber. They are also low in calories and can help with digestion.",
      ],
    ];

    final bestSelling = [
      [
        "assets/images/best_selling/bell_pepper.png",
        "Bell Pepper Red",
        "1kg, Price",
        "\$4.99",
        "Bell peppers are rich in vitamins A and C, and are a great addition to a healthy diet.",
      ],
      [
        "assets/images/best_selling/ginger.png",
        "Ginger",
        "250gm, Price",
        "\$4.99",
        "Ginger is known for its anti-inflammatory properties and can help with digestion.",
      ],
      [
        "assets/images/best_selling/bell_pepper.png",
        "Bell Pepper Red",
        "1kg, Price",
        "\$4.99",
        "Bell peppers are rich in vitamins A and C, and are a great addition to a healthy diet.",
      ],
    ];

    final groceryTypes = [
      ["assets/images/grocery_types/pulses.png", "Pulses", Color(0x26F8A44C)],
      ["assets/images/grocery_types/rice.png", "Rice", Color(0x2653B175)],
    ];

    final groceries = [
      [
        "assets/images/groceries/beef.png",
        "Beef Bone",
        "1kg, Price",
        "\$4.99",
        "Beef bones are a great source of collagen and can help support joint health.",
      ],
      [
        "assets/images/groceries/chicken.png",
        "Chicken",
        "1kg, Price",
        "\$4.99",
        "Chicken is a lean source of protein and is rich in essential nutrients.",
      ],
      [
        "assets/images/groceries/beef.png",
        "Beef Bone",
        "1kg, Price",
        "\$4.99",
        "Beef bones are a great source of collagen and can help support joint health.",
      ],
    ];

    emit(
      state.copyWith(
        isLoading: false,
        exclusiveOffers: exclusiveOffers,
        bestSelling: bestSelling,
        groceryTypes: groceryTypes,
        groceries: groceries,
      ),
    );
  }
}
