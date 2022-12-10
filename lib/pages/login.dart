// import 'dart:html';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:scrappy/main.dart';
import 'package:scrappy/drawer.dart';
import 'package:scrappy/pages/register.dart';
import 'package:scrappy/providers/userProvider.dart';

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
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Color(0xFF003320),
      ),
      drawer: PublicDrawer(),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.recycling,
              size: 100,
              color: Color(0xFF003320),
            ),

            SizedBox(height: 20),

            Text(
              'Scrap.py',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),

            SizedBox(height: 20),

            // Username textfield
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
                            border: InputBorder.none, hintText: 'Username'),
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
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color(0xFF003320),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                    child: TextButton(
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size.fromHeight(40)),
                  ),
                  onPressed: () async {
                    // 'username' and 'password' should be the values of the user login form.
                    final response = await request
                        .login("https://scrappy.up.railway.app/login/", {
                      'username': username,
                      'password': password1,
                    });

                    if (request.loggedIn) {
                      // Code here will run if the login succeeded.
                      context.read<UserProvider>().saveAdmin(response['admin']);
                      context.read<UserProvider>().saveLogin(true);
                      context
                          .read<UserProvider>()
                          .saveUsername(response['username']);

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => MyHomePage()));
                    } else {
                      // Code here will run if the login failed (wrong username/password).
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Incorrect username or password!')));
                    }
                  },
                )),
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum mempunyai akun?",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextButton(
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Color(0xFF198F85),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const RegisterPage()));
                  },
                ),
              ],
            ),
          ]),
        ),
      )),
    );
  }
}
