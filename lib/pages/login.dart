import 'package:flutter/material.dart';
import 'package:flutter_hello_world/main_home/nav_menu.dart';
import 'package:flutter_hello_world/pages/Register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscureText = true;
  bool emailValid = false;
  bool passwordValid = false;
  final regexEmail = RegExp(r'^[^@]{2,}@gmail\.com$');
  final regexPassword = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$');

  @override
  Widget build(BuildContext context) {
    final double fullScreenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            width: fullScreenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/decorations/top_decor.png"),
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
                    style: TextStyle(fontSize: 14, color: Color(0xFF7C7C7C)),
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
            child: TextFormField(
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF7C7C7C),
                  fontSize: 16,
                ),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập đúng định dạng email';
                } else if (!regexEmail.hasMatch(value)) {
                  return 'Vui lòng nhập đúng định dạng email';
                }
                return null;
              },
              onChanged: (value) {
                if (regexEmail.hasMatch(value)) {
                  setState(() {
                    emailValid = true;
                  });
                } else {
                  setState(() {
                    emailValid = false;
                  });
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 25, right: 25),
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                TextFormField(
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7C7C7C),
                      fontSize: 16,
                    ),
                  ),
                  obscureText: obscureText,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mật khẩu';
                    } else if (!regexPassword.hasMatch(value)) {
                      return 'Vui lòng nhập mật khẩu có ít nhất 6 kí tự, chứa ít nhất 1 chữ hoa, 1 chữ thường và 1 số';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (regexPassword.hasMatch(value)) {
                      setState(() {
                        passwordValid = true;
                      });
                    } else {
                      setState(() {
                        passwordValid = false;
                      });
                    }
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
            padding: EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 20),
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
                  image: AssetImage("assets/images/decorations/bottom_decor.png"),
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
                      child: ElevatedButton(
                        onPressed: () {
                          if (emailValid && passwordValid) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavMenu(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              emailValid && passwordValid
                                  ? Color(0xFF53B175)
                                  : Color(0xFF959595),
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
      ),
    );
  }
}
