import 'package:flutter/material.dart';
import 'package:flutter_hello_world/main_home/nav_menu.dart';
import 'package:flutter_hello_world/pages/login.dart';
import 'package:google_fonts/google_fonts.dart';

void main(List<String> args) {
  runApp(Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.robotoTextTheme()),
      home: Login(),
    );
  }
}
