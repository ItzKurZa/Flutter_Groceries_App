import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int amount = 1;
  bool removeDisable = true;
  bool addDisable = false;
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    final double fullScreenWidth = MediaQuery.of(context).size.width;
    final double fullScreenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: fullScreenWidth,
        height: fullScreenHeight,
        color: Colors.white,
        constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    color: Color(0xEDF2F2F2),
                  ),
                  width: fullScreenWidth,
                  height: fullScreenHeight * 0.4,
                  child: Image(image: AssetImage("assets/images/exclusive_offers/apple.png")),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_new),
                        iconSize: 25,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.ios_share_outlined),
                        iconSize: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 25, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Natural Red Apple",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "1kg, Price",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF7C7C7C),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite_outline),
                    iconSize: 30,
                    color: favorite ? Color(0xFFFF0052) : Color(0xFF7C7C7C),
                    onPressed: () {
                      setState(() {
                        favorite = !favorite;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 12, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.remove),
                        iconSize: 30,
                        color:
                            removeDisable
                                ? Color(0xFFB3B3B3)
                                : Color(0xFF53B175),
                        onPressed: () {
                          setState(() {
                            if (amount > 1) {
                              amount--;
                              if (addDisable == true) {
                                addDisable = false;
                              }
                            } else {
                              removeDisable = true;
                            }
                          });
                        },
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Color(0xFFE2E2E2),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(17)),
                        ),
                        height: 50,
                        width: 50,
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none),
                          controller: TextEditingController(
                            text: amount.toString(),
                          ),
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.top,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        iconSize: 30,
                        color:
                            addDisable ? Color(0xFFB3B3B3) : Color(0xFF53B175),
                        onPressed: () {
                          setState(() {
                            if (amount < 5) {
                              amount++;
                              if (removeDisable == true) {
                                removeDisable = false;
                              }
                            } else {
                              addDisable = true;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  Text(
                    "\$4.99",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 25, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1, color: Color(0xB2E2E2E2)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Product Detail",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.keyboard_arrow_down),
                            iconSize: 28,
                          ),
                        ],
                      ),
                      Text(
                        "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.",
                        style: TextStyle(color: Color(0xFF7C7C7C)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 25, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1, color: Color(0xB2E2E2E2)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nutritions",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Color(0xFFEBEBEB),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text("100gr", style: TextStyle(fontSize: 9)),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_ios_rounded),
                            iconSize: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1, color: Color(0xB2E2E2E2)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Review",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Color(0xFFF3603F),
                              ),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Color(0xFFF3603F),
                              ),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Color(0xFFF3603F),
                              ),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Color(0xFFF3603F),
                              ),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Color(0xFFF3603F),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_ios_rounded),
                            iconSize: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 25, right: 20),
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Color(0xFF53B175),
                  fixedSize: Size.fromWidth(double.infinity),
                  padding: EdgeInsets.symmetric(vertical: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Add to basket",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
