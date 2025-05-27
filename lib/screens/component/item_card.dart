import 'package:flutter/material.dart';
import 'package:flutter_hello_world/screens/pages/product_detail.dart';

class ItemCard extends StatelessWidget {
  final String image;
  final String name;
  final String details;
  final String description;
  final String price;

  const ItemCard({
    super.key,
    required this.image,
    required this.name,
    required this.details,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFE2E2E2), width: 1),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Image(image: AssetImage(image)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                details,
                style: TextStyle(fontSize: 14, color: Color(0xFF7C7C7C)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                price,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => ProductDetail(
                            image,
                            name,
                            details,
                            description,
                            price,
                          ),
                    ),
                  );
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Color(0xFF53B175),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  minimumSize: Size(20, 20),
                ),
                child: Icon(Icons.add, size: 25),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
