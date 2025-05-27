import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hello_world/logics/cubits/login_cubit.dart';
import 'package:flutter_hello_world/logics/states/login_state.dart';
import 'package:flutter_hello_world/screens/home/nav_menu.dart';
import 'package:flutter_hello_world/screens/pages/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscureText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double fullScreenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.isLoginSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => NavMenu()),
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: <Widget>[
              Container(
                width: fullScreenWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/decorations/top_decor.png",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 100, bottom: 40),
                  child: Image(
                    image: AssetImage("assets/images/decorations/logo.png"),
                    height: 56,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 25,
                  right: 25,
                ),
                child: SizedBox(
                  width: fullScreenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Log in",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Enter your emails and password",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF7C7C7C),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 25,
                  right: 25,
                ),
                child: TextField(
                  style: TextStyle(fontSize: 18),
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7C7C7C),
                      fontSize: 16,
                    ),
                    errorText:
                        state.emailError.isEmpty ? null : state.emailError,
                  ),
                  onChanged: (value) {
                    context.read<LoginCubit>().onchangeEmail(value);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 25, right: 25),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextField(
                      style: TextStyle(fontSize: 18),
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF7C7C7C),
                          fontSize: 16,
                        ),
                        errorText:
                            state.passwordError.isEmpty
                                ? null
                                : state.passwordError,
                      ),
                      obscureText: obscureText,
                      onChanged: (value) {
                        context.read<LoginCubit>().onchangePassword(value);
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 5,
                  left: 25,
                  right: 25,
                  bottom: 20,
                ),
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Color(0xFF181725), fontSize: 14),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/decorations/bottom_decor.png",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      spacing: 10,
                      children: [
                        SizedBox(
                          width: fullScreenWidth,
                          height: 67,
                          child:
                              state.isLoading
                                  ? Center(child: CircularProgressIndicator())
                                  : ElevatedButton(
                                    onPressed:
                                        state.emailError.isEmpty &&
                                                state.passwordError.isEmpty &&
                                                emailController
                                                    .text
                                                    .isNotEmpty &&
                                                passwordController
                                                    .text
                                                    .isNotEmpty
                                            ? () {
                                              context.read<LoginCubit>().login(
                                                emailController.text,
                                                passwordController.text,
                                              );
                                            }
                                            : null,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          state.emailError.isEmpty &&
                                                  state.passwordError.isEmpty
                                              ? Color(0xFF53B175)
                                              : null,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide.none,
                                        borderRadius: BorderRadius.circular(19),
                                      ),
                                    ),
                                    child: Text(
                                      "Log In",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFFFF9FF),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Dont have an account?",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Register(),
                                  ),
                                );
                              },
                              style: TextButton.styleFrom(),
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  color: Color(0xFF53B175),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
