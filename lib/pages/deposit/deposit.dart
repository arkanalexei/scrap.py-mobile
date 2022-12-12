// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrappy/drawer.dart';
import 'package:scrappy/components/deposit/recentDeposits.dart';
import 'package:scrappy/providers/userProvider.dart';

import 'form.dart';

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
        minimum: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Your recent deposits:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Visibility(
                  visible: context.watch<UserProvider>().getLogin,
                  child: Column(
                    children: [
                      const RecentDeposits(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DepositFormPage()),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Make new deposit!",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: !context.watch<UserProvider>().getLogin,
                  child: const Text("Login to see your recent deposits!"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
