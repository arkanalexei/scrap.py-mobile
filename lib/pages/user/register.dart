import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:scrappy/pages/user/login.dart';
import 'package:scrappy/drawer.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String username = "";
  String password1 = "";
  String password2 = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
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
                            border: InputBorder.none,
                            hintText: 'Your Username'),
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
                            border: InputBorder.none,
                            hintText: 'Your Password'),
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
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Your Password Again'),
                        onChanged: (String? value) {
                          setState(() {
                            password2 = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            password2 = value!;
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
                    "Sign Up",
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
                    final response =
                        await request.post("https://scrappy.up.railway.app/register/", {
                      'username': username,
                      'password1': password1,
                      'password2': password2,
                    });



                    if (response['status'] == true) {
                      // Code here will run if the register succeeded.
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(response['message'])));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const LoginPage()));
                    } else {
                      // Code here will run if the register failed
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(response['message'])));
                    }

                    
                  },
                )),
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sudah punya akun?",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextButton(
                  child: Text(
                    "Login",
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
                                const LoginPage()));
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
