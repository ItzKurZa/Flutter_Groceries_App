import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xFFE2E2E2)),
                ),
              ),
              padding: EdgeInsets.only(
                left: 25,
                right: 25,
                top: 40,
                bottom: 30,
              ),
              child: Row(
                spacing: 20,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(27),
                    ),
                    child: Image(
                      image: AssetImage("assets/images/profile/profile_image.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Afsar Hossen",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit_outlined,
                              color: Color(0xFF53B175),
                            ),
                            iconSize: 20,
                          ),
                        ],
                      ),
                      Text(
                        "Imshuvo97@gmail.com",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF7C7C7C),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xFFE2E2E2)),
                ),
              ),
              padding: EdgeInsets.only(
                left: 20,
                right: 15,
                top: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.shopping_bag_outlined, size: 30),
                      Text(
                        "Orders",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xFFE2E2E2)),
                ),
              ),
              padding: EdgeInsets.only(
                left: 20,
                right: 15,
                top: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.badge_outlined, size: 30),
                      Text(
                        "My Details",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xFFE2E2E2)),
                ),
              ),
              padding: EdgeInsets.only(
                left: 20,
                right: 15,
                top: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.location_on_outlined, size: 30),
                      Text(
                        "Delivery Address",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xFFE2E2E2)),
                ),
              ),
              padding: EdgeInsets.only(
                left: 20,
                right: 15,
                top: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.credit_card, size: 30),
                      Text(
                        "Payment Methods",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xFFE2E2E2)),
                ),
              ),
              padding: EdgeInsets.only(
                left: 20,
                right: 15,
                top: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.confirmation_num_outlined, size: 30),
                      Text(
                        "Promo Code",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xFFE2E2E2)),
                ),
              ),
              padding: EdgeInsets.only(
                left: 20,
                right: 15,
                top: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.notifications_none, size: 30),
                      Text(
                        "Notifications",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xFFE2E2E2)),
                ),
              ),
              padding: EdgeInsets.only(
                left: 20,
                right: 15,
                top: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.help_outline, size: 30),
                      Text(
                        "Help",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xFFE2E2E2)),
                ),
              ),
              padding: EdgeInsets.only(
                left: 20,
                right: 15,
                top: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.error_outline, size: 30),
                      Text(
                        "About",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Color(0xFFF2F3F2),
                  padding: EdgeInsets.symmetric(vertical: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(19)),
                  ),
                ),

                child: Text(
                  "Log Out",
                  style: TextStyle(
                    color: Color(0xFF53B175),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
