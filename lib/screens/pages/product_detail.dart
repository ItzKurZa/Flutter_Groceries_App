import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hello_world/logics/cubits/product_detail_cubit.dart';
import 'package:flutter_hello_world/logics/states/product_detail_state.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail(
    this.image,
    this.name,
    this.details,
    this.description,
    this.price, {
    super.key,
  });

  final String image;
  final String name;
  final String details;
  final String description;
  final String price;

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  void initState() {
    super.initState();
    context.read<ProductDetailCubit>().setProductDetails(
      image: widget.image,
      name: widget.name,
      details: widget.details,
      description: widget.description,
      price: widget.price,
    );
  }

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
        child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.image.isEmpty ||
                state.name.isEmpty ||
                state.details.isEmpty ||
                state.description.isEmpty ||
                state.price.isEmpty) {
              return Center(
                child: Text(
                  "No product details available",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                            child: Image(image: AssetImage(state.image)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                              left: 10,
                              right: 10,
                            ),
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
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 25,
                          right: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  state.name,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  state.details,
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
                              color:
                                  state.isFavorited
                                      ? Color(0xFFFF0052)
                                      : Color(0xFF7C7C7C),
                              onPressed: () {
                                context
                                    .read<ProductDetailCubit>()
                                    .toggleFavorite();
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 12,
                          right: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  iconSize: 30,
                                  color:
                                      state.removeDisable
                                          ? Color(0xFFB3B3B3)
                                          : Color(0xFF53B175),
                                  onPressed: () {
                                    context
                                        .read<ProductDetailCubit>()
                                        .decrementAmount();
                                  },
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Color(0xFFE2E2E2),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(17),
                                    ),
                                  ),
                                  height: 50,
                                  width: 50,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    controller: TextEditingController(
                                      text: state.amount.toString(),
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
                                      state.addDisable
                                          ? Color(0xFFB3B3B3)
                                          : Color(0xFF53B175),
                                  onPressed: () {
                                    context
                                        .read<ProductDetailCubit>()
                                        .incrementAmount();
                                  },
                                ),
                              ],
                            ),
                            Text(
                              state.price,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 30,
                          left: 25,
                          right: 20,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                width: 1,
                                color: Color(0xB2E2E2E2),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                              left: 5,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  state.description,
                                  style: TextStyle(color: Color(0xFF7C7C7C)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          left: 25,
                          right: 20,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                width: 1,
                                color: Color(0xB2E2E2E2),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                              left: 5,
                            ),
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
                                      child: Text(
                                        "100gr",
                                        style: TextStyle(fontSize: 9),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                      ),
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
                              top: BorderSide(
                                width: 1,
                                color: Color(0xB2E2E2E2),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                              left: 5,
                            ),
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
                                      icon: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                      ),
                                      iconSize: 18,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
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
              );
            }
          },
        ),
      ),
    );
  }
}
