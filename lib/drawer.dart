import 'package:flutter/material.dart';
import 'package:scrappy/main.dart';
import 'package:scrappy/login.dart';
import 'package:scrappy/register.dart';

class PublicDrawer extends StatefulWidget {
  const PublicDrawer({super.key});
  @override
  _PublicDrawerState createState() => _PublicDrawerState();
}

class _PublicDrawerState extends State<PublicDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('Main Page'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                          )),
                );
              },
            ),
            ListTile(
              title: const Text('Login'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage(
                          )),
                );
              },
            ),
            ListTile(
              title: const Text('Register'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegisterPage(
                          )),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
