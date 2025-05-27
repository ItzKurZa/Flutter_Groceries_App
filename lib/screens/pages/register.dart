import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hello_world/logics/cubits/register_cubit.dart';
import 'package:flutter_hello_world/logics/states/register_state.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool obscureText = true;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double fullScreenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state.isRegisterSuccess) {
            Navigator.pop(context);
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
                  padding: EdgeInsets.only(top: 60),
                  child: Image(
                    image: AssetImage("assets/images/decorations/logo.png"),
                    height: 56,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 25, right: 25),
                child: SizedBox(
                  width: fullScreenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Enter your credentials to continue",
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
                padding: EdgeInsets.only(top: 20, left: 25, right: 25),
                child: TextField(
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: "First Name",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7C7C7C),
                      fontSize: 16,
                    ),
                    errorText:
                        state.firstNameError.isEmpty
                            ? null
                            : state.firstNameError,
                  ),
                  controller: firstNameController,
                  onChanged: (value) {
                    context.read<RegisterCubit>().onchangeFirstName(value);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 25, right: 25),
                child: TextField(
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7C7C7C),
                      fontSize: 16,
                    ),
                    errorText:
                        state.lastNameError.isEmpty
                            ? null
                            : state.lastNameError,
                  ),
                  controller: lastNameController,
                  onChanged: (value) {
                    context.read<RegisterCubit>().onchangeLastName(value);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 25, right: 25),
                child: TextField(
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7C7C7C),
                      fontSize: 16,
                    ),
                    errorText:
                        state.usernameError.isEmpty
                            ? null
                            : state.usernameError,
                  ),
                  controller: usernameController,
                  onChanged: (value) {
                    context.read<RegisterCubit>().onchangeUsername(value);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 25, right: 25),
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
                    context.read<RegisterCubit>().onchangeEmail(value);
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
                        context.read<RegisterCubit>().onchangePassword(value);
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
                  top: 15,
                  left: 25,
                  right: 25,
                  bottom: 20,
                ),
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: "By continuing you agree to our "),
                      TextSpan(
                        text: "Terms of Service",
                        style: TextStyle(color: Color(0xFF53B175)),
                      ),
                      TextSpan(text: " and "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(color: Color(0xFF53B175)),
                      ),
                    ],
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
                                        state.firstNameError.isEmpty &&
                                                state.lastNameError.isEmpty &&
                                                state.usernameError.isEmpty &&
                                                state.emailError.isEmpty &&
                                                state.passwordError.isEmpty &&
                                                firstNameController
                                                    .text
                                                    .isNotEmpty &&
                                                lastNameController
                                                    .text
                                                    .isNotEmpty &&
                                                usernameController
                                                    .text
                                                    .isNotEmpty &&
                                                emailController
                                                    .text
                                                    .isNotEmpty &&
                                                passwordController
                                                    .text
                                                    .isNotEmpty
                                            ? () {
                                              context
                                                  .read<RegisterCubit>()
                                                  .register(
                                                    firstNameController.text,
                                                    lastNameController.text,
                                                    usernameController.text,
                                                    emailController.text,
                                                    passwordController.text,
                                                  );
                                            }
                                            : null,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          state.firstNameError.isEmpty &&
                                                  state.lastNameError.isEmpty &&
                                                  state.usernameError.isEmpty &&
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
                                      "Sign Up",
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
                              "Already have an account?",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: TextButton.styleFrom(),
                              child: Text(
                                "Sign in",
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
