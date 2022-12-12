import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrappy/drawer.dart';
import 'package:scrappy/components/feedback/recentFeedback.dart';
import 'package:scrappy/providers/userProvider.dart';

import 'feedbackform.dart';

class FeedbackHomePage extends StatelessWidget {
  const FeedbackHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const PublicDrawer(),
      appBar: AppBar(
        title: const Text("Feedback"),
        backgroundColor: const Color(0xFF003320),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              // const Text("Your Feedback History"),
              Visibility(
                visible: context.watch<UserProvider>().getLogin,
                child: Column(
                  children: [
                    const RecentFeedback(),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FeedbackFormPage()),
                          );
                        },
                        child: const Text("Send Your Feedbacks"))
                  ],
                ),
              ),
              Visibility(
                visible: !context.watch<UserProvider>().getLogin,
                child: const Text("Login to see and organize your feedback"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
