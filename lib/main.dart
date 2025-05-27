import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hello_world/logics/cubits/explore_cubit.dart';
import 'package:flutter_hello_world/logics/cubits/login_cubit.dart';
import 'package:flutter_hello_world/logics/cubits/product_detail_cubit.dart';
import 'package:flutter_hello_world/logics/cubits/register_cubit.dart';
import 'package:flutter_hello_world/logics/cubits/shop_cubit.dart';
import 'package:flutter_hello_world/screens/pages/login.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => ShopCubit()..loadProducts()),
        BlocProvider(create: (context) => ExploreCubit()..loadCategories()),
        BlocProvider(create: (context) => ProductDetailCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(textTheme: GoogleFonts.robotoTextTheme()),
        home: Login(),
      ),
    );
  }
}
