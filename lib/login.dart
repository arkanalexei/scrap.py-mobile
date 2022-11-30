// import 'dart:html';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:scrappy/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }
  String username = "";
  String password1 = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
          Icon(
            Icons.recycling,
            size: 100,
            color: Color(0xFF003320),
          ),

          SizedBox(height: 20),

          Text(
            'Hello Again!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
          ),

          SizedBox(height: 10),

          Text(
            'Welcome back, you\'ve been missed!',
            style: TextStyle(
              fontSize: 20,
            ),
          ),

          SizedBox(height: 20),

          // email textfield
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Email'),
                      onChanged: (String? value) {
                        setState(() {
                          username = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          username = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Empty username";
                        }
                        return null;
                      },
                    ),
                  ))),

          SizedBox(height: 10),

          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Password'),
                      onChanged: (String? value) {
                        setState(() {
                          password1 = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          password1 = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Empty password";
                        }
                        return null;
                      },
                    ),
                  ))),

          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF003320),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),

          Padding(
             padding: const EdgeInsets.symmetric(horizontal: 25),
             child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF003320),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: TextButton(
                  child: Text("ye"),
                  onPressed: () async {
                    // 'username' and 'password' should be the values of the user login form.
                    final response = await request.login("http://10.0.2.2:8000/login/", {
                      'username': username,
                      'password': password1,
                    });

                    print(username);
                    print(password1);
                    if (request.loggedIn) {
                      // Code here will run if the login succeeded.
                      if (_loginFormKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const MyHomePage(title: "Broo")
                          )
                        );
                      }
                    } else {
                      // Code here will run if the login failed (wrong username/password).
                    }
                  },
                )
                ),
              ),
            ),

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not a member? ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Register Now",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue)),
            ],
          ),
        ]),
      )),
    );
  }
}
