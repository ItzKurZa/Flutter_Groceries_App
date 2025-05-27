import 'package:flutter/material.dart';

class GroceriesTypeCard extends StatelessWidget {
  final String image;
  final String name;
  final Color backgroundColor;

  const GroceriesTypeCard({
    super.key,
    required this.image,
    required this.name,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image(image: AssetImage(image)),
          ),
          Text(
            name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
