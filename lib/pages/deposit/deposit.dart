import 'package:flutter/material.dart';
import 'package:scrappy/main.dart';
import 'package:scrappy/drawer.dart';
import 'package:intl/intl.dart';

class DepositHomePage extends StatelessWidget {
  const DepositHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const PublicDrawer(),
      appBar: AppBar(
        title: const Text("Deposit"),
        backgroundColor: const Color(0xFF003320),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text("Your recent deposits"),
          ],
        ),
      ),
    );
  }
}
